import 'package:flutter/widgets.dart';

/*
Device pixels are also referred to as physical pixels. Logical pixels are also referred to as device-independent or resolution-independent pixels.

By definition, there are roughly 38 logical pixels per centimeter, or about 96 logical pixels per inch, of the physical display. The value returned by devicePixelRatio is ultimately obtained either from the hardware itself, the device drivers, or a hard-coded value stored in the operating system or firmware, and may be inaccurate, sometimes by a significant margin.

The Flutter framework operates in logical pixels, so it is rarely necessary to directly deal with this property.

https://api.flutter.dev/flutter/dart-ui/Window/devicePixelRatio.html

 */
class ScreenInfo {
  static const TAG = '[ScreenInfo] ';

  static MediaQueryData mediaQueryData;

  static EdgeInsets viewInsets;
  static EdgeInsets padding;

  static double width;
  static double height;

  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double safeAreaHorizontal;
  static double safeAreaVertical;

  static double safeBlockHorizontal;
  static double safeBlockVertical;

  static double safeAreaWidth;
  static double safeAreaHeight;

  static const designScreenWidth = 375;
  static const designScreenHeight = 812;

  static double widthFactor;
  static double heightFactor;

  static bool isPortrait = true;
  static bool isLandscape = false;

  static bool isLandscapeLeft = false;
  static bool isLandscapeRight = false;

  static bool rotating = false;

  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    viewInsets = mediaQueryData.viewInsets;
    padding = mediaQueryData.padding;

    width = mediaQueryData.size.width;
    height = mediaQueryData.size.height;

    blockSizeHorizontal = width / 100;
    blockSizeVertical = height / 100;

    safeAreaHorizontal = mediaQueryData.padding.left + mediaQueryData.padding.right;
    safeAreaVertical = mediaQueryData.padding.top + mediaQueryData.padding.bottom;

    safeBlockHorizontal = (width - safeAreaHorizontal) / 100;
    safeBlockVertical = (height - safeAreaVertical) / 100;

    safeAreaWidth = width - safeAreaHorizontal;
    safeAreaHeight = height - safeAreaVertical;

    widthFactor = width / designScreenWidth;
    heightFactor = height / designScreenHeight;

    Orientation orientation = mediaQueryData.orientation;
    isPortrait = orientation == Orientation.portrait;
    isLandscape = orientation == Orientation.landscape;
  }
}
