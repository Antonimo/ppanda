import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ppanda/modules/home/home_screen.dart';
import 'package:ppanda/modules/page_not_found.dart';

class AppRouter {
  static const TAG = '[AppRouter] ';

  static final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey();

  // TODO: Flutter navigation has built in system for working with slashes, so that navigating to '/some/item/route' will try to open 3 different screens..

  static const routeSplash = '/splash';


  static const routeHome = '/home';


  static void navigateTo(String route) {
    switch (route) {
      case routeHome:
        appNavigatorKey.currentState.pushNamedAndRemoveUntil(routeHome, (Route<dynamic> route) => false);
        break;
      default:
    }
  }

  static void navigateBack() {
    appNavigatorKey.currentState.maybePop();
  }

  static MaterialPageRoute getRoute(RouteSettings settings) {
    print(TAG + ' getRoute ${settings.name}');


    switch (settings.name) {
      case AppRouter.routeHome:
        return MaterialPageRoute(settings: settings, builder: (BuildContext context) => HomeScreen());
      default:
        return null; // will go to onUnknownRoute
    }
  }

  static MaterialPageRoute onUnknownRoute(RouteSettings settings) {
    print(TAG + 'onUnknownRoute');
    return MaterialPageRoute(settings: settings, builder: (BuildContext context) => PageNotFound());
  }
}

