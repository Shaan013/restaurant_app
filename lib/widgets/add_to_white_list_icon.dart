import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../generated/assets.dart';
import '../values/theme/app_colors.dart';

Widget addToWhiteListIcon({bool isSelected = false}) {
  return CircleAvatar(
    backgroundColor: isSelected ? AppColors.orange : AppColors.grey.withAlpha(130),
    child: SvgPicture.asset(Assets.svgs.heartFill.path),
  );
}
