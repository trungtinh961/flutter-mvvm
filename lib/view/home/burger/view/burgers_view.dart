import 'package:architecture_widgets/architecture_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermvvmtemplate/core/base/view/base_widget.dart';
import 'package:fluttermvvmtemplate/core/init/lang/locale_keys.g.dart';
import 'package:fluttermvvmtemplate/core/init/network/vexana_manager.dart';
import 'package:fluttermvvmtemplate/product/widget/card/burger_card.dart';
import 'package:fluttermvvmtemplate/view/_product/_utilty/burger_network_enum.dart';
import 'package:fluttermvvmtemplate/view/home/burger/service/burger_serivce.dart';
import 'package:fluttermvvmtemplate/view/home/burger/viewmodel/burger_view_model.dart';
import 'package:kartal/kartal.dart';

enum _BurgerViews { BEST_SELL_TITLE, BURGER_FOVORITE, NORMAL_TITLE, BURGER_VIEW }

class BurgersView extends StatelessWidget {
  const BurgersView({Key? key}) : super(key: key);

  final String _title = 'VB BURGER';
  @override
  Widget build(BuildContext context) {
    return BaseView<BurgerViewModel>(
      viewModel: BurgerViewModel(BurgerService(VexanaManager.instance.networkManager)),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, BurgerViewModel viewModel) => Scaffold(
        appBar: buildAppBar(context, viewModel),
        body: buildObserverBuildbody(viewModel, context),
      ),
    );
  }

  Observer buildObserverBuildbody(
    BurgerViewModel viewModel,
    BuildContext context,
  ) {
    return Observer(
      builder: (_) {
        return viewModel.isLoading ? buildCenterLoading() : buildPaddingListView(context, viewModel);
      },
    );
  }

  Padding buildPaddingListView(
    BuildContext context,
    BurgerViewModel viewModel,
  ) {
    return Padding(
      padding: context.paddingLow,
      child: ListView.builder(
        itemCount: _BurgerViews.values.length,
        itemBuilder: (context, index) {
          final views = _BurgerViews.values[index];
          switch (views) {
            case _BurgerViews.BEST_SELL_TITLE:
              return buildTextBestSell(context);
            case _BurgerViews.BURGER_FOVORITE:
              return buildSizedBoxFavorite(context, viewModel);
            case _BurgerViews.NORMAL_TITLE:
              return buildPaddingNormalTitle(context);
            case _BurgerViews.BURGER_VIEW:
              return buildSizedBoxNormalBurgers(viewModel, context);
          }
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, BurgerViewModel viewModel) {
    return AppBar(
      title: Text(
        _title,
        style: context.textTheme.headline5?.copyWith(
          fontWeight: FontWeight.w600,
          color: context.colorScheme.onError,
        ),
      ),
      centerTitle: false,
      leading: Icon(Icons.food_bank_outlined, color: context.colorScheme.onError),
      actions: [
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => buildBottomSheetBody(context, viewModel),
            );
          },
          icon: const Icon(Icons.filter_alt),
        )
      ],
    );
  }

  Widget buildBottomSheetBody(
    BuildContext context,
    BurgerViewModel viewModel,
  ) =>
      Padding(
        padding: context.paddingLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Filter'),
            const Divider(height: 2, thickness: 2),
            Row(
              children: [
                Expanded(
                  child: RangePriceSLider(
                    min: 10,
                    max: 50,
                    onCompleted: (values) {
                      viewModel.changeRangeValues(values);
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    viewModel.fetchMinMax();
                  },
                  icon: const Icon(Icons.check_box_outline_blank),
                )
              ],
            ),
            Card(
              child: Column(
                children: [
                  Wrap(
                    spacing: 10,
                    children: BurgerSortValues.values
                        .map(
                          (e) => IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              viewModel.fetchSort(e);
                            },
                            icon: Text(e.rawValue, maxLines: 1),
                          ),
                        )
                        .toList(),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => viewModel.changeAscending(true),
                        icon: const Icon(Icons.plus_one),
                      ),
                      IconButton(
                        onPressed: () => viewModel.changeAscending(true),
                        icon: const Icon(Icons.design_services_rounded),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Padding buildPaddingNormalTitle(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingLow,
      child: Text(
        LocaleKeys.home_burgers_normalProducts.tr(),
        style: context.textTheme.headline5,
      ),
    );
  }

  Text buildTextBestSell(BuildContext context) {
    return Text(
      LocaleKeys.home_burgers_favoriteProducts.tr(),
      style: context.textTheme.headline3?.copyWith(
        color: context.colorScheme.onSecondary,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Center buildCenterLoading() => const Center(child: CircularProgressIndicator.adaptive());

  SizedBox buildSizedBoxFavorite(
    BuildContext context,
    BurgerViewModel viewModel,
  ) =>
      SizedBox(
        height: context.dynamicHeight(0.3),
        child: const BurgerCard().buildList(viewModel.favoriteBurgerModel),
      );

  Widget buildSizedBoxNormalBurgers(
    BurgerViewModel viewModel,
    BuildContext context,
  ) {
    viewModel.fetchNormalItems();

    return SizedBox(
      child: Observer(
        builder: (_) {
          return viewModel.isLoadingMain
              ? SizedBox(
                  height: context.dynamicHeight(0.1),
                  child: buildCenterLoading(),
                )
              : GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return BurgerCard(
                      model: viewModel.mainBurgerModel[index],
                    );
                  },
                  itemCount: viewModel.mainBurgerModel.length,
                );
        },
      ),
    );
  }
}
