import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_app/values/theme/app_colors.dart';

import '../../../generated/assets.dart';

class HomeBottomNavigationBar extends StatefulWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  State<HomeBottomNavigationBar> createState() =>
      _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      children: [
        Divider(height: 1.h),
        BottomAppBar(
          color: Theme.of(context).colorScheme.surface,
          child: Row(
            mainAxisSize: .max,
            mainAxisAlignment: .spaceAround,
            children: [
              IconButton(onPressed: () {}, icon: SvgPicture.asset(Assets.svgs.house.path)),
              IconButton(onPressed: () {}, icon: SvgPicture.asset(Assets.svgs.tag.path)),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Icon(Icons.shopping_cart, color: AppColors.white),
              ),
              IconButton(onPressed: () {}, icon:SvgPicture.asset(Assets.svgs.heart.path)),
              IconButton(onPressed: () {}, icon:SvgPicture.asset(Assets.svgs.person.path)),
            ],
          ),
        ),
      ],
    );
  }
}
