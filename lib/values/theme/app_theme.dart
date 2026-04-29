import 'package:flutter/material.dart';
import 'app_colors_scheme.dart';
import 'app_text_theme.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: .dark,
    colorScheme: AppColorsScheme.darkColorsScheme,
    textTheme: AppTextTheme.darkTextTheme,
  );
  static ThemeData light = ThemeData(
    brightness: .light,
    colorScheme: AppColorsScheme.lightColorsScheme,
    textTheme: AppTextTheme.lightTextThem,
  );
}
