import 'package:flutter/material.dart';

class UIParameters {
  // Height of statusbar
  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).viewPadding.top;
  }

  // Height of screen
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // Width of screen
  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
