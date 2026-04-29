import 'package:flutter/material.dart';
import 'package:restaurant_app/values/theme/app_border_radius.dart';

Widget fullWidthButton({
  required String text,
  VoidCallback? onTap,
  required Color color,
  TextStyle? style,
  Widget? label,
}) {
  if (label != null) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(12),
              backgroundColor: color,
              shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.m),
            ),
            onPressed: onTap ?? () {},
            label: Text(text, style: style),
            icon: label,
          ),
        ),
      ],
    );
  }
  return Row(
    children: [
      Expanded(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(12),
            backgroundColor: color,
            shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.m),
          ),
          onPressed: onTap ?? () {},
          child: Text(text, style: style),
        ),
      ),
    ],
  );
}
