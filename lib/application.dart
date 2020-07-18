import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ppanda/app_router.dart';
import 'package:ppanda/dictionary/doctionary_keys.dart';
import 'package:ppanda/modules/order/order_form_screen.dart';
import 'package:ppanda/modules/splash_screen.dart';
import 'package:ppanda/theme/app_theme.dart';
import 'package:ppanda/utils/screen_info.dart';
import 'dictionary/dictionary.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Application extends StatefulWidget {
  Application({Key key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  static const TAG = '[_ApplicationState]';

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    Timer(Duration(seconds: 3), (){
      AppRouter.navigateTo(AppRouter.routeHome);
    });

//    WidgetsBinding.instance.addPostFrameCallback((_) => AppRouter.navigateTo(AppRouter.routeHome));

    ///
    ///
    /// DEBUG CACHE
    ///
//    DefaultCacheManager manager = DefaultCacheManager();
//    manager.emptyCache();

//    storeSubscription = widget.store.onChange.listen((state){
////      print('||||| new state: $state');
//
////      print('  ');
//      print(TAG + 'navigationState.history: ${state.navigationState.history}');
////      print('   ');
//    });

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(TAG + '__________ APP BUILD __________');

    return MaterialApp(
      onGenerateTitle: (BuildContext context) {
        AppDictionary.init(context);
        return AppDictionary.getByKey(DictionaryKeys.title);
      },
      navigatorKey: AppRouter.appNavigatorKey,
//      navigatorObservers: <NavigatorObserver>[],
      home: SplashScreen(),
//      home: OrderFormScreen(),
      theme: appTheme,
      onGenerateRoute: AppRouter.getRoute,
      onUnknownRoute: AppRouter.onUnknownRoute,
      debugShowCheckedModeBanner: false,
      locale: Locale('he'),
      localizationsDelegates: [
        const AppDictionaryDelegate(),
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
//        const Locale('en'),
        const Locale('he'),
//        const Locale('ru'),
      ],
      builder: (context, child) {

        ScreenInfo().init(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child,
        );
      },
    );
  }
}
