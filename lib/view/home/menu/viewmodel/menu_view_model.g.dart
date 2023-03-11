// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MenuViewModel on _MenuViewModel, Store {
  late final _$listMenuAtom =
      Atom(name: '_MenuViewModel.listMenu', context: context);

  @override
  List<MenuModel> get listMenu {
    _$listMenuAtom.reportRead();
    return super.listMenu;
  }

  @override
  set listMenu(List<MenuModel> value) {
    _$listMenuAtom.reportWrite(value, super.listMenu, () {
      super.listMenu = value;
    });
  }

  @override
  String toString() {
    return '''
listMenu: ${listMenu}
    ''';
  }
}
