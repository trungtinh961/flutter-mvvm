import 'package:all_of_template/features/buy_view.dart';
import 'package:architecture_widgets/src/card/not_found_navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/constants/navigation/navigation_constants.dart';
import 'package:fluttermvvmtemplate/view/authenticate/splash/view/splash_view.dart';
import 'package:fluttermvvmtemplate/view/home/menu/view/menu_view.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const SplashView(), NavigationConstants.DEFAULT);

      case NavigationConstants.BUY_VIEW:
        return normalNavigate(const BuyView(), NavigationConstants.BUY_VIEW);

      case NavigationConstants.MENU_VIEW:
        return normalNavigate(const MenuView(), NavigationConstants.MENU_VIEW);

      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
      builder: (context) => widget,
      //analytciste görülecek olan sayfa ismi için pageName veriyoruz
      settings: RouteSettings(name: pageName),
    );
  }
}
