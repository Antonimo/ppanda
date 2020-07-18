import 'package:flutter/material.dart';
import 'package:ppanda/theme/app_colors.dart';

/*

To use CSS style line height use strutStyle leading:

Text(
  'Some Text',
  strutStyle: StrutStyle(
    leading: lineHeight -1,
  ),
),

*/

class AppTextStyle {
  static const H1 = TextStyle(
    fontSize: 20.7,
    fontWeight: FontWeight.bold,
//    height: 1.16,
    //actualHeight: 24
    letterSpacing: 0.25,
    color: AppColors.primaryText,
  );


  static const H1LineHeight = StrutStyle(
    leading: (1.16 - 1),
  );


  static final brand1 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w800,
    height: 1,
    letterSpacing: 1.5,
    color: AppColors.cardTitle,
  );

  static final brand2 = TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
  );

  static final itemTitle = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    height: 1,
//    letterSpacing: 2.0,
    color: AppColors.cardTitle,
  );

  static final badge = TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.normal,
    height: 1,
    color: AppColors.cardTitle,
  );

  static final price = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    height: 1.16,
//    letterSpacing: 2.0,
    color: Colors.indigo,
  );


  static final menuTitle = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    height: 1,
    color: Colors.black,
  );


  static final menuItem = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.normal,
    height: 1,
    color: Colors.black,
  );



  static final infoListTileTitle = TextStyle(
    fontSize: 12.4,
    fontWeight: FontWeight.w600,
//    height: 1.44,
    //actualHeight: 20
    letterSpacing: 0.4,
    color: AppColors.primaryText.withOpacity(0.6),
  );

  static final infoListTileContent = TextStyle(
    fontSize: 16.6,
    fontWeight: FontWeight.w500,
//    height: 1.68,
    //actualHeight: 20
    letterSpacing: 0.5,
    color: AppColors.primaryText,
  );

  static const pickerTitle = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.24,
    color: AppColors.black,
    decoration: TextDecoration.none,
  );
}
