import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBorderRadius {
  AppBorderRadius._();

  // ================= CIRCULAR =================
  static final BorderRadius zero = BorderRadius.zero;
  static final BorderRadius xs = BorderRadius.circular(4.r);
  static final BorderRadius s = BorderRadius.circular(8.r);
  static final BorderRadius m = BorderRadius.circular(12.r);
  static final BorderRadius l = BorderRadius.circular(16.r);
  static final BorderRadius xl = BorderRadius.circular(20.r);
  static final BorderRadius xxl = BorderRadius.circular(24.r);
  static final BorderRadius xxxl = BorderRadius.circular(32.r);

  // Fully rounded (Buttons, Chips, Pill-shaped UI)
  static final BorderRadius max = BorderRadius.circular(999.r);

  // ================= TOP ONLY =================
  // Common for Bottom Sheets or Top Banners
  static final BorderRadius topS = BorderRadius.vertical(top: Radius.circular(8.r));
  static final BorderRadius topM = BorderRadius.vertical(top: Radius.circular(12.r));
  static final BorderRadius topL = BorderRadius.vertical(top: Radius.circular(20.r));
  static final BorderRadius topXL = BorderRadius.vertical(top: Radius.circular(30.r));

  // ================= BOTTOM ONLY =================
  // Common for Top Bars or Hero Images
  static final BorderRadius bottomS = BorderRadius.vertical(bottom: Radius.circular(8.r));
  static final BorderRadius bottomM = BorderRadius.vertical(bottom: Radius.circular(12.r));
  static final BorderRadius bottomL = BorderRadius.vertical(bottom: Radius.circular(20.r));

  // ================= LEFT/RIGHT ONLY =================
  // Common for Drawer menus or side labels
  static final BorderRadius leftM = BorderRadius.horizontal(left: Radius.circular(12.r));
  static final BorderRadius rightM = BorderRadius.horizontal(right: Radius.circular(12.r));
}