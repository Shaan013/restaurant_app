import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_app/core/db/hive/hive_service.dart';
import 'package:restaurant_app/core/locator/main_locator.dart';
import 'package:restaurant_app/data/models/responses/Categories.dart';
import 'package:restaurant_app/feature/auth/view_model/logout_conroller.dart';
import 'package:restaurant_app/feature/home/widgets/category_list_view.dart';
import 'package:restaurant_app/feature/home/widgets/home_bottom_navigation_bar.dart';
import 'package:restaurant_app/feature/home/widgets/home_page_widget.dart';
import 'package:restaurant_app/feature/home/widgets/near_hotels_widget.dart';
import 'package:restaurant_app/feature/home/widgets/wish_list_show.dart';
import 'package:restaurant_app/router/app_route.dart';
import 'package:restaurant_app/values/extensions/app_padding_ext.dart';
import 'package:restaurant_app/values/theme/app_border_radius.dart';
import 'package:restaurant_app/values/theme/app_colors.dart';
import 'package:restaurant_app/values/theme/app_edge_insets.dart';
import 'package:restaurant_app/values/theme/app_input_decoration.dart';
import 'package:restaurant_app/widgets/recommended_widget.dart';

import '../../../data/local_data/share_prefrence_info.dart';
import '../../../generated/assets.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return Scaffold(
      // floatingActionButton:
      bottomNavigationBar: HomeBottomNavigationBar(
        initialIndex: 0,
        onChage: (vlaue) {
          setState(() {
            pageIndex = vlaue;
          });
        },
      ),
      body: IndexedStack(
        index: pageIndex,
        children: [
          HomePageWidget(),
          ShowFood(recList: HiveService.getListOfCart(), title: "cart List"),
          ShowFood(recList: HiveService.getListOfWhish()),
          Center(
            child: ElevatedButton(
              onPressed: () {
                final log = LogoutConroller();
                log.handleTryLogout(context);
              },
              child: Text(" Log out"),
            ),
          ),
        ],
      ),
    );
  }

  Divider homePageDivider(BuildContext context) {
    return Divider(
      color: Theme.of(context).colorScheme.outline.withAlpha(50),
      thickness: 8.h,
      height: 8.h,
    );
  }
}
