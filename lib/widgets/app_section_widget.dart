import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/extensions/app_padding_ext.dart';

class AppSectionWidget extends StatelessWidget {
  final String name;

  final String subtitle;
  final Widget child;

  const AppSectionWidget({
    super.key,
    required this.name,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Column(
      crossAxisAlignment: .start,
      children: [
        buildTitle(textTheme, name),
        Text(subtitle, style: textTheme.bodyLarge, maxLines: 1),
        child,
      ],
    ).pAllM;
  }

  Row buildTitle(TextTheme textTheme, String title) {
    return Row(
      children: [
        Expanded(
          child: Text(title, style: textTheme.headlineMedium, maxLines: 1),
        ),
        Row(
          spacing: 8.w,
          mainAxisSize: .min,
          children: [
            Text("View All", style: textTheme.bodyLarge, maxLines: 1),
            Icon(Icons.arrow_forward, size: 15.sp),
          ],
        ),
      ],
    );
  }
}
