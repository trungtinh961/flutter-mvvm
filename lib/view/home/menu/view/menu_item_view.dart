import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/home/menu/model/menu_model.dart';
import 'package:kartal/kartal.dart';

class MenuItemView extends StatelessWidget {
  MenuItemView({
    Key? key,
    this.item,
  }) : super(key: key);

  final MenuModel? item;

  @override
  Widget build(BuildContext context) {
    if (item == null) return SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.teal[100],
      child: Stack(
        children: [
          Image.asset(item!.image),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              child: Center(
                child: Text(
                  item!.name,
                  style: context.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.colorScheme.primaryContainer,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
