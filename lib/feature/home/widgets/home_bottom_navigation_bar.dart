import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_app/values/theme/app_colors.dart';

import '../../../generated/assets.dart';

class HomeBottomNavigationBar extends StatefulWidget {
  final ValueChanged<int> onChage;
  final int initialIndex;

  const HomeBottomNavigationBar({
    super.key,
    required this.initialIndex,
    required this.onChage,
  });

  @override
  State<HomeBottomNavigationBar> createState() =>
      _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {
  late int selectedIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex = widget.initialIndex;
  }

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
            children: bottomAppBarItem(context),
          ),
        ),
      ],
    );
  }

  void handleIcon(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onChage(selectedIndex);
  }

  List<Widget> bottomAppBarItem(BuildContext context) {
    return [
      IconButton(
        onPressed: () => handleIcon(0),
        icon: SvgPicture.asset(Assets.svgs.house.path),
      ),
      IconButton(
        onPressed: () => handleIcon(1),
        icon: SvgPicture.asset(Assets.svgs.tag.path),
      ),
      FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.shopping_cart, color: AppColors.white),
      ),
      IconButton(
        onPressed: () => handleIcon(2),
        icon: SvgPicture.asset(Assets.svgs.heart.path),
      ),
      IconButton(
        onPressed: () => handleIcon(3),
        icon: SvgPicture.asset(Assets.svgs.person.path),
      ),
    ];
  }
}
