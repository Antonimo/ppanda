import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ppanda/modules/home/home_screen.dart';
import 'package:ppanda/modules/order/order_form_screen.dart';
import 'package:ppanda/modules/page_not_found.dart';
import 'package:ppanda/modules/shop_item/cakepop.dart';
import 'package:ppanda/modules/shop_item/cupcake.dart';
import 'package:ppanda/modules/shop_item/magnum.dart';
import 'package:ppanda/modules/shop_item/mousse.dart';
import 'package:ppanda/modules/shop_item/shop_item_screen.dart';

class AppRouter {
  static const TAG = '[AppRouter] ';

  static final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey();

  // TODO: Flutter navigation has built in system for working with slashes, so that navigating to '/some/item/route' will try to open 3 different screens..

  static const routeSplash = '/splash';


  static const routeHome = '/home';
  static const routeShopItem = 'shopItem';
  static const routeOrderForm = 'orderForm';


  static void navigateTo(String route) {
    switch (route) {
      case routeHome:
        appNavigatorKey.currentState.pushNamedAndRemoveUntil(routeHome, (Route<dynamic> route) => false);
        break;
      case routeOrderForm:
        appNavigatorKey.currentState.pushNamed(routeOrderForm);
        break;
      default:
    }
  }

  static void navigateBack() {
    appNavigatorKey.currentState.maybePop();
  }

  static MaterialPageRoute getRoute(RouteSettings settings) {
    print(TAG + ' getRoute ${settings.name}, ${settings.arguments}');


    switch (settings.name) {
      case AppRouter.routeHome:
        return MaterialPageRoute(settings: settings, builder: (BuildContext context) => HomeScreen());
      case AppRouter.routeShopItem:
        final String shopItemId = (settings.arguments as Map)['id'];

//        if (shopItemId == 'cakepop'){
//          return MaterialPageRoute(settings: settings, builder: (BuildContext context) => CakePop(shopItemId));
//        }
//        if (shopItemId == 'cupcake'){
//          return MaterialPageRoute(settings: settings, builder: (BuildContext context) => CupCake(shopItemId));
//        }
//        if (shopItemId == 'mousse'){
//          return MaterialPageRoute(settings: settings, builder: (BuildContext context) => Mousse(shopItemId));
//        }
//        if (shopItemId == 'magnum'){
//          return MaterialPageRoute(settings: settings, builder: (BuildContext context) => Magnum(shopItemId));
//        }

        return MaterialPageRoute(settings: settings, builder: (BuildContext context) => ShopItemScreen(shopItemId));
      case AppRouter.routeOrderForm:
        return MaterialPageRoute(settings: settings, builder: (BuildContext context) => OrderFormScreen());
      default:
        return null; // will go to onUnknownRoute
    }
  }

  static MaterialPageRoute onUnknownRoute(RouteSettings settings) {
    print(TAG + 'onUnknownRoute');
    return MaterialPageRoute(settings: settings, builder: (BuildContext context) => PageNotFound());
  }
}

