import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Widget getLableRow({
  required String svgUrl,
  required String text,
  TextStyle? textStyle,
}) {
  return Row(
    spacing: 8.w,
    mainAxisSize: .min,
    children: [
      SvgPicture.asset(svgUrl),
      Text(text, style: textStyle),
    ],
  );
}
