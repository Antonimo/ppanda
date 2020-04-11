import 'dart:ui';
import 'package:flutter/material.dart';

class AppColors {

  // f8bcbd

  static const int _primaryValue = 0xFFf8bcbd;
  static const MaterialColor primary = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(0xFFfef7f7),
      100: Color(0xFFfdebeb),
      200: Color(0xFFfcdede),
      300: Color(0xFFfad0d1),
      400: Color(0xFFf9c6c7),
      500: Color(_primaryValue),
      600: Color(0xFFf7b6b7),
      700: Color(0xFFf6adae),
      800: Color(0xFFf5a5a6),
      900: Color(0xFFf39798),
    },
  );


  static const int _secondaryValue = 0xFF284B75;
  static const MaterialColor secondary = MaterialColor(
    _secondaryValue,
    <int, Color>{
      50: Color(0xFFE5E8ED),
      100: Color(0xFFBCC6D4),
      200: Color(0xFF92A2B6),
      300: Color(0xFF6A7E99),
      400: Color(0xFF4A6485),
      500: Color(_secondaryValue),
      600: Color(0xFF21446D),
      700: Color(0xFF193B62),
      800: Color(0xFF143255),
      900: Color(0xFF0F223D),
    },
  );

  static const white = const Color(0xFFFFFFFF);
  static const offWhite = const Color(0xFFFAFAFA);

  static const black= const Color(0xFF000000);

  static const surfaceBase = const Color(0xFFFCFDFF);
  static const surfaceDark = const Color(0xFFF2F3F5);

  static const red = const Color(0xFFCD2245);
  static const greenBright = const Color(0xFF1FCF85);

  static const primaryText = Colors.black;
  static const secondaryText = const Color(0xFF1FCF85);
  static const primaryTextDark = black;

  static const darkBlueGradient = const LinearGradient(
    colors: [
      const Color(0xFF13304E),
      const Color(0xFF041430),
    ],
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
  );

  static const dark06 = const Color.fromRGBO(0, 0, 0, 0.6);
}
