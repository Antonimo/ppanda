//import 'dart:io';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:ppanda/dictionary/dictionary.dart';
//import 'package:ppanda/dictionary/doctionary_keys.dart';
//import 'package:ppanda/theme/app_colors.dart';
//import 'package:ppanda/theme/app_theme.dart';

//void confirmActivateSecurityMode(BuildContext context, Function onConfirm) {
//  final Widget title = Text(AppDictionary.getByKey(DictionaryKeys.areYouSureYouWantToActivateSecurityMode));
//  final Widget subtitle = Text(AppDictionary.getByKey(DictionaryKeys.poolscoutWillAlertYouWhenItDetectsAnyoneNearThePool));
//  final Widget activateText = Text(AppDictionary.getByKey(DictionaryKeys.activateNow), style: TextStyle(color: AppColors.primary[600]));
//  final Function activateOnTap = () {
//    Navigator.of(context, rootNavigator: true).pop();
//    onConfirm();
//  };
//
//  final Widget yesWithTimerText = Text(AppDictionary.getByKey(DictionaryKeys.yesWithTimer), style: TextStyle(color: AppColors.primary[600]));
//  final Function yesWithTimerOnTap = () {
////    Navigator.of(context, rootNavigator: true).pop();
//
//    // TODO: with Timer
//  };
//
//  final Widget cancel = Text(AppDictionary.getByKey(DictionaryKeys.cancel), style: TextStyle(color: Colors.black.withOpacity(0.6)));
//  final Function cancelOnTap = () {
//    Navigator.of(context, rootNavigator: true).pop();
//  };
//
//  ///
//  ///
//  /// Delete Confirm Dialog
//  ///
//  if (Platform.isAndroid) {
//    showModalBottomSheet(
//      context: context,
//      useRootNavigator: true,
//      builder: (BuildContext context) {
//        return Theme(
//          data: appThemeBlackStateOverlay,
//          child: Container(
//            child: Wrap(
//              children: <Widget>[
//                ListTile(
//                  title: title,
//                  subtitle: subtitle,
//                ),
//                ListTile(
//                  title: activateText,
//                  onTap: activateOnTap,
//                ),
//                ListTile(
//                  title: cancel,
//                  onTap: cancelOnTap,
//                ),
//              ],
//            ),
//          ),
//        );
//      },
//    );
//  } else if (Platform.isIOS) {
//    showCupertinoModalPopup(
//      context: context,
//      useRootNavigator: true,
//      builder: (BuildContext context) {
//        return Theme(
//          data: appThemeBlackStateOverlay,
//          child: CupertinoActionSheet(
//            title: title,
//            message: subtitle,
//            actions: [
//              CupertinoActionSheetAction(
//                child: activateText,
//                onPressed: activateOnTap,
//              ),
//              CupertinoActionSheetAction(
//                child: cancel,
//                onPressed: cancelOnTap,
//              ),
//            ],
//          ),
//        );
//      },
//    );
//  }
//}

