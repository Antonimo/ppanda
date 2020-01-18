import 'package:flutter/material.dart';

class AppNavigatorObserver extends NavigatorObserver {
  Function onPop;

  void setOnPop(Function onPop) {
    this.onPop = onPop;
  }

  @override
  void didPop(Route route, Route previousRoute) {
    if (this.onPop != null) {
      this.onPop(route, previousRoute);
    }
    super.didPop(route, previousRoute);
  }
}
