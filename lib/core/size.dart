import 'package:flutter/material.dart';

class AppSize {
  AppSize._();

  static double height = 0.0;
  static double width = 0.0;
  static double longestSide = 0.0;
  static double shortestSide = 0.0;
  static double keyboardHeight = 0.0;

  ///[Text sizes]
  static double titleSmall = AppSize.shortestSide / 26;
  static double labelSmall = AppSize.shortestSide / 32;
  static double bodySmall = AppSize.shortestSide * 0.025;

  /// [Icon size]
  static final double iconSizeDrawer = AppSize.shortestSide / 22;
  static final double iconSizeBottomNav = AppSize.shortestSide / 19;
  static final double iconSizeXLarge = AppSize.shortestSide / 4;
  static final double iconSizeLarge = AppSize.shortestSide / 7;
  static final double iconSizeMedium = AppSize.shortestSide / 10;
  static final double iconSizeSmall = AppSize.shortestSide / 16;
  static final double iconSizeXSmall = AppSize.shortestSide / 24;

  /// [Spacing constants]
  static final SizedBox spaceXSmall = SizedBox(
      height: AppSize.longestSide / 52, width: AppSize.longestSide / 52);      
  static final SizedBox spaceSmall = SizedBox(
      height: AppSize.longestSide / 32, width: AppSize.longestSide / 32);
  static final SizedBox spaceMedium = SizedBox(
      height: AppSize.longestSide / 16, width: AppSize.longestSide / 16);
  static final SizedBox spaceLarge =
      SizedBox(height: AppSize.longestSide / 8, width: AppSize.longestSide / 8);
  static final SizedBox spaceXLarge =
      SizedBox(height: AppSize.longestSide / 4, width: AppSize.longestSide / 4);

  /// [Paddings related to login and register screen]
  static double topPadding = 0;
  static double bottomPadding = 0;
  static double sidePadding = AppSize.shortestSide * 0.1;
  static EdgeInsets loginPadding = EdgeInsets.only(
    top: AppSize.topPadding,
    bottom: AppSize.bottomPadding + 10,
    left: AppSize.sidePadding,
    right: AppSize.sidePadding,
  );

  /// [Radius constants]
  static final double buttonRadius = AppSize.shortestSide * 0.03;

  static void setSizes(BuildContext context) {
    AppSize.topPadding = MediaQuery.of(context).viewPadding.top;
    AppSize.bottomPadding = MediaQuery.of(context).viewPadding.bottom;
    AppSize.keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    AppSize.height = MediaQuery.of(context).size.height;
    AppSize.width = MediaQuery.of(context).size.width;
    AppSize.longestSide = MediaQuery.of(context).size.longestSide;
    AppSize.shortestSide = MediaQuery.of(context).size.shortestSide;
  }
}
