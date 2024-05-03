import 'package:flutter/material.dart';

class AppSizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidht;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidht = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = screenWidht! / 100;
    blockSizeVertical = screenHeight! / 100;
  }
}
