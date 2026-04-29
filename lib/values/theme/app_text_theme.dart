import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/values/theme/app_colors.dart';
import 'package:restaurant_app/values/theme/app_font_family.dart';

class AppTextTheme {
  AppTextTheme._();

  static const _defaultOverflow = TextOverflow.ellipsis;
  static const String _fontFamily = 'Inter'; // Replace with your project font

  static TextTheme darkTextTheme = TextTheme(
    // ================= DISPLAY =================
    // Used for large headers, hero sections, and intro screens
    displayLarge: TextStyle(
      fontSize: 57.sp,
      fontWeight: FontWeight.w800,
      color: Colors.white,
      fontFamily: AppFontFamily.rebond,
      letterSpacing: -0.25,
      overflow: _defaultOverflow,
    ),
    displayMedium: TextStyle(
      fontSize: 45.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontFamily: AppFontFamily.rebond,
      overflow: _defaultOverflow,
    ),
    displaySmall: TextStyle(
      fontSize: 36.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontFamily: AppFontFamily.rebond,
      overflow: _defaultOverflow,
    ),

    // ================= HEADLINE =================
    // Used for page headers and prominent titles
    headlineLarge: TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w800,
      color: Colors.white,
      fontFamily: AppFontFamily.rebond,
      overflow: _defaultOverflow,
    ),
    headlineMedium: TextStyle(
      fontSize: 28.sp,
      fontWeight: FontWeight.w800,
      color: Colors.white,
      fontFamily: AppFontFamily.rebond,
      overflow: _defaultOverflow,
    ),
    headlineSmall: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontFamily: AppFontFamily.rebond,
      overflow: _defaultOverflow,
    ),

    // ================= TITLE =================
    // Used for card titles, dialog headers, and list items
    titleLarge: TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontFamily: _fontFamily,
      overflow: _defaultOverflow,
    ),
    titleMedium: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontFamily: _fontFamily,
      letterSpacing: 0.15,
      overflow: _defaultOverflow,
    ),
    titleSmall: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: Colors.white70,
      fontFamily: _fontFamily,
      letterSpacing: 0.1,
      overflow: _defaultOverflow,
    ),

    // ================= BODY =================
    // Used for long-form text and standard descriptions
    bodyLarge: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
      color: Colors.white,
      fontFamily: _fontFamily,
      letterSpacing: 0.5,
      overflow: _defaultOverflow,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: Colors.white,
      fontFamily: _fontFamily,
      letterSpacing: 0.25,
      overflow: _defaultOverflow,
    ),
    bodySmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: Colors.white70,
      fontFamily: _fontFamily,
      letterSpacing: 0.4,
      overflow: _defaultOverflow,
    ),

    // ================= LABEL =================
    // Used for buttons, captions, and small meta-data
    labelLarge: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w800,
      color: Colors.white,
      fontFamily: AppFontFamily.rebond,
      letterSpacing: 0.1,
      overflow: _defaultOverflow,
    ),
    labelMedium: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white70,
      fontFamily: AppFontFamily.rebond,
      letterSpacing: 0.5,
      overflow: _defaultOverflow,
    ),
    labelSmall: TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white54,
      fontFamily: AppFontFamily.rebond,
      letterSpacing: 0.5,
      overflow: _defaultOverflow,
    ),
  );
  static TextTheme lightTextThem = TextTheme(
    // ================= DISPLAY =================
    // Used for large headers, hero sections, and intro screens
    displayLarge: TextStyle(
      fontSize: 57.sp,
      fontWeight: FontWeight.w800,
      color: Colors.black,
      fontFamily: AppFontFamily.rebond,
      letterSpacing: -0.25,
      overflow: _defaultOverflow,
    ),
    displayMedium: TextStyle(
      fontSize: 45.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black,
      fontFamily: AppFontFamily.rebond,
      overflow: _defaultOverflow,
    ),
    displaySmall: TextStyle(
      fontSize: 36.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: AppFontFamily.rebond,
      overflow: _defaultOverflow,
    ),

    // ================= HEADLINE =================
    // Used for page headers and prominent titles
    headlineLarge: TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w800,
      color: Colors.black,
      fontFamily: AppFontFamily.rebond,
      overflow: _defaultOverflow,
    ),
    headlineMedium: TextStyle(
      fontSize: 28.sp,
      fontWeight: FontWeight.w800,
      color: Colors.black,
      fontFamily: AppFontFamily.rebond,
      overflow: _defaultOverflow,
    ),
    headlineSmall: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: AppFontFamily.rebond,
      overflow: _defaultOverflow,
    ),

    // ================= TITLE =================
    // Used for card titles, dialog headers, and list items
    titleLarge: TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: _fontFamily,
      overflow: _defaultOverflow,
    ),
    titleMedium: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontFamily: _fontFamily,
      letterSpacing: 0.15,
      overflow: _defaultOverflow,
    ),
    titleSmall: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontFamily: _fontFamily,
      letterSpacing: 0.1,
      overflow: _defaultOverflow,
    ),

    // ================= BODY =================
    // Used for long-form text and standard descriptions
    bodyLarge: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontFamily: _fontFamily,
      letterSpacing: 0.5,
      overflow: _defaultOverflow,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontFamily: _fontFamily,
      letterSpacing: 0.25,
      overflow: _defaultOverflow,
    ),
    bodySmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontFamily: _fontFamily,
      letterSpacing: 0.4,
      overflow: _defaultOverflow,
    ),

    // ================= LABEL =================
    // Used for buttons, captions, and small meta-data
    labelLarge: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w800,
      color: Colors.white,
      fontFamily: AppFontFamily.rebond,
      letterSpacing: 0.1,
      overflow: _defaultOverflow,
    ),
    labelMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white70,
      fontFamily: AppFontFamily.rebond,
      letterSpacing: 0.5,
      overflow: _defaultOverflow,
    ),
    labelSmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white54,
      fontFamily: AppFontFamily.rebond,
      letterSpacing: 0.5,
      overflow: _defaultOverflow,
    ),
  );
}
