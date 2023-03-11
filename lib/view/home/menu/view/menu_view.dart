import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermvvmtemplate/view/home/menu/viewmodel/menu_view_model.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/base/view/base_widget.dart';
import '../../../authenticate/splash/viewmodel/splash_view_model.dart';
import 'menu_item_view.dart';

class MenuView extends StatefulWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<MenuViewModel>(
      viewModel: MenuViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: buildScaffoldBody,
    );
  }

  Widget buildScaffoldBody(BuildContext context, MenuViewModel viewModel) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildMenuListView(viewModel),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuListView(MenuViewModel viewModel) {
    return Observer(
      builder: (_) => GridView.builder(
        itemCount: viewModel.listMenu.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return MenuItemView(
            item: viewModel.listMenu[index],
          );
        },
      ),
    );
  }
}
