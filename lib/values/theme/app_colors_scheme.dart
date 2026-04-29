import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppColorsScheme {
  static ColorScheme darkColorsScheme = ColorScheme.fromSeed(
    brightness: .dark,
    seedColor: AppColors.black,
  );
  static ColorScheme lightColorsScheme = ColorScheme.fromSeed(
    brightness: .light,
    surface: AppColors.white,
    primary: AppColors.orange,
    seedColor: AppColors.orange,
    outline: AppColors.grey,
  );
}
