import 'package:flutter/material.dart';

extension WidgetX on Widget {
  // --- LAYOUT & WRAPPERS ---

  /// Wraps widget in a Center
  Widget get center => Center(child: this);

  /// Wraps widget in an Expanded
  Widget expand([int flex = 1]) => Expanded(flex: flex, child: this);

  /// Wraps widget in a Flexible
  Widget flexible([int flex = 1, FlexFit fit = FlexFit.loose]) =>
      Flexible(flex: flex, fit: fit, child: this);

  /// Useful for quick backgrounds or constraints
  Widget container({
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? color,
    double? width,
    double? height,
    AlignmentGeometry? alignment,
    BoxDecoration? decoration,
  }) =>
      Container(
        padding: padding,
        margin: margin,
        color: decoration == null ? color : null,
        decoration: decoration,
        width: width,
        height: height,
        alignment: alignment,
        child: this,
      );

  // --- PADDING (Simplified Naming) ---

  Widget p(double value) => Padding(padding: EdgeInsets.all(value), child: this);

  Widget px(double value) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: value), child: this);

  Widget py(double value) =>
      Padding(padding: EdgeInsets.symmetric(vertical: value), child: this);

  Widget pOnly({double l = 0, double t = 0, double r = 0, double b = 0}) =>
      Padding(
          padding: EdgeInsets.only(left: l, top: t, right: r, bottom: b),
          child: this);

  // --- CLIPPING ---

  Widget clipRRect(double radius) => ClipRRect(
    borderRadius: BorderRadius.circular(radius),
    child: this,
  );

  Widget get clipOval => ClipOval(child: this);

  // --- INTERACTION ---

  /// Adds a tap gesture quickly
  Widget onTap(VoidCallback? action, {bool opaque = true}) {
    return GestureDetector(
      behavior: opaque ? HitTestBehavior.opaque : null,
      onTap: action,
      child: this,
    );
  }

  // --- VISIBILITY (Cleaned up) ---

  Widget visible(bool isVisible, {bool maintainSize = false}) => Visibility(
    visible: isVisible,
    maintainSize: maintainSize,
    maintainAnimation: maintainSize,
    maintainState: maintainSize,
    child: this,
  );

  // --- ALIGNMENT ---

  Widget align(Alignment alignment) => Align(alignment: alignment, child: this);

  Widget get alignCenterLeft => align(Alignment.centerLeft);
  Widget get alignCenterRight => align(Alignment.centerRight);
}