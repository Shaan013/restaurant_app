import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Divider homePageDivider(BuildContext context) {
  return Divider(
    color: Theme.of(context).colorScheme.outline.withAlpha(50),
    thickness: 8.h,
    height: 8.h,
  );
}