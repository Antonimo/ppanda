import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: AppColors.primary,
//  primaryColor: primary,
//  primaryColorBrightness: Brightness.light,
//  primaryColorLight: ,
//  primaryColorDark: primaryDark,
  accentColor: AppColors.secondary,
//  accentColorBrightness: Brightness.light,
//  canvasColor: AppColors.secondary[900],
//  scaffoldBackgroundColor: Colors.black,
//  bottomAppBarColor: ,
//  cardColor: ,
//  dividerColor: ,
//  focusColor: ,
//  hoverColor: ,
  highlightColor: AppColors.white.withOpacity(0.08),
  splashColor: AppColors.white.withOpacity(0.12),
//  splashFactory: ,
//  selectedRowColor: ,
//  unselectedWidgetColor: ,
//  disabledColor: ,
//  buttonColor: ,
  buttonTheme: ButtonThemeData(
    minWidth: 14.0,
    disabledColor: AppColors.secondary[700],
  ),
//  toggleButtonsTheme: ,
//  secondaryHeaderColor: ,
//  textSelectionColor: ,
//  cursorColor: ,
//  textSelectionHandleColor: ,
//  backgroundColor: Colors.red,
//  dialogBackgroundColor: ,
//  indicatorColor: Colors.white,
//  hintColor: Colors.white,
//  errorColor: ,
//  toggleableActiveColor: ,
  fontFamily: "Lato",
//  textTheme: TextTheme(
//    button: AppTextStyle.button,
//  ),
//  primaryTextTheme: ,
//  accentTextTheme: ,
//  inputDecorationTheme: ,
//  iconTheme: IconThemeData(color: Colors.white),
//  primaryIconTheme: ,
//  accentIconTheme: ,
//  sliderTheme: ,
  tabBarTheme: TabBarTheme(
    indicator: BoxDecoration(
      borderRadius: BorderRadius.circular(6.0),
      color: AppColors.secondary[800],
    ),
  ),
//  tooltipTheme: ,
//  cardTheme: ,
//  chipTheme: ,
//  platform: ,
//  materialTapTargetSize: ,
//  applyElevationOverlayColor: ,
//  pageTransitionsTheme: ,
//  appBarTheme: AppBarTheme(
//    color: accent,
//    brightness: Brightness.dark, //for some reason, in appBar, Brightness.dark results in white icons
//    iconTheme: IconThemeData(
//      color: Colors.white,
//    ),
//  ),
//  bottomAppBarTheme: ,
//  colorScheme: ,
//  dialogTheme: DialogTheme(
//    backgroundColor: primaryDark,
//    titleTextStyle: textStyleBody2.copyWith(
//      color: primaryText,
//      fontWeight: FontWeight.w400,
//      letterSpacing: 0.15,
//    ),
//  ),
//  floatingActionButtonTheme: ,
//  typography: ,
//  cupertinoOverrideTheme: ,
  snackBarTheme: SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    backgroundColor: AppColors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
//    contentTextStyle: AppTextStyle.label4,
    elevation: 4,
  ),
//  bottomSheetTheme: ,
//  popupMenuTheme: ,
//  bannerTheme: ,
  dividerTheme: DividerThemeData(
    color: AppColors.secondary[700],
    space: 1.0,
    thickness: 1.0,
  ),
);


ThemeData appThemeBlackStateOverlay = appTheme.copyWith(
  highlightColor: Colors.black.withOpacity(0.08),
  splashColor: Colors.black.withOpacity(0.08),
);

ThemeData appThemePrimaryStateOverlay = appTheme.copyWith(
  highlightColor: AppColors.primary[700].withOpacity(0.12),
  splashColor: AppColors.primary[700].withOpacity(0.12),
);