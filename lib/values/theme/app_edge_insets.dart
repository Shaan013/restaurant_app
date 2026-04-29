import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppEdgeInsets {
  // AppEdgeInsets._();

  // ================= ALL SIDES =================
  static EdgeInsets allXXS = EdgeInsets.all(2.r);
  static EdgeInsets allXS = EdgeInsets.all(4.r);
  static EdgeInsets allS = EdgeInsets.all(8.r);
  static EdgeInsets allM = EdgeInsets.all(12.r);
  static EdgeInsets allL = EdgeInsets.all(16.r);
  static EdgeInsets allXL = EdgeInsets.all(24.r);
  static EdgeInsets allXXL = EdgeInsets.all(32.r);

  // ================= SYMMETRIC HORIZONTAL =================
  static EdgeInsets hS = EdgeInsets.symmetric(horizontal: 8.w);
  static EdgeInsets hM = EdgeInsets.symmetric(horizontal: 16.w);
  static EdgeInsets hL = EdgeInsets.symmetric(horizontal: 24.w);

  // ================= SYMMETRIC VERTICAL =================
  static EdgeInsets vS = EdgeInsets.symmetric(vertical: 8.h);
  static EdgeInsets vM = EdgeInsets.symmetric(vertical: 16.h);
  static EdgeInsets vL = EdgeInsets.symmetric(vertical: 24.h);

  // ================= COMBINED =================
  // Common pattern for list items or cards
  static EdgeInsets hvM = EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h);
  static EdgeInsets hvS = EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h);

  // ================= PAGE PADDING =================
  // Standard padding for the entire screen
  static EdgeInsets pagePadding = EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h);
}