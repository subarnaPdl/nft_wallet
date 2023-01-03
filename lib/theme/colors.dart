import 'package:flutter/material.dart';

class AppColors {
  /// Common
  final Color accent1 = const Color(0xFF0f111e);
  final Color accent2 = const Color(0xFF161b2a);
  final Color white = Colors.white;
  final Color grey = const Color(0xFF999999);
  final Color black = const Color(0xFF1E1B18);

  ThemeData themeData() {
    // TextTheme
    TextTheme txtTheme = ThemeData.dark().textTheme;
    Color txtColor = white;

    // ColorScheme or ColorTheme
    ColorScheme colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: accent1,
      primaryContainer: accent1,
      secondary: accent2,
      secondaryContainer: accent2,
      background: accent1,
      surface: accent1,
      onBackground: txtColor,
      onSurface: txtColor,
      onError: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.grey,
      error: Colors.red,
    );

    // Now that we have ColorScheme and TextTheme, we can create the ThemeData
    // Also add on some extra properties that ColorScheme seems to miss
    var t =
        ThemeData.from(textTheme: txtTheme, colorScheme: colorScheme).copyWith(
      textSelectionTheme: TextSelectionThemeData(cursorColor: accent1),
      highlightColor: accent1,
    );

    /// Return the themeData
    return t;
  }
}
