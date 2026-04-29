import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_app/data/models/responses/Categories.dart';
import 'package:restaurant_app/feature/home/widgets/category_list_view.dart';
import 'package:restaurant_app/feature/home/widgets/home_bottom_navigation_bar.dart';
import 'package:restaurant_app/feature/home/widgets/near_hotels_widget.dart';
import 'package:restaurant_app/values/extensions/app_padding_ext.dart';
import 'package:restaurant_app/values/theme/app_border_radius.dart';
import 'package:restaurant_app/values/theme/app_colors.dart';
import 'package:restaurant_app/values/theme/app_edge_insets.dart';
import 'package:restaurant_app/values/theme/app_input_decoration.dart';

import '../../../generated/assets.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: SvgPicture.asset(Assets.svgs.location.path).pAllM,
        title: Row(
          children: [
            Expanded(
              child: Text(
                "1901 Thornridge Cir. Shiloh...",
                style: textTheme.headlineSmall,
              ),
            ),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
      // floatingActionButton:
      bottomNavigationBar: HomeBottomNavigationBar(),
      body: Column(
        children: [
          buildsearchBar().phM,
          // Image.network("https://tse2.mm.bing.net/th/id/OIP.dJRgtbtpJ827mCUmbDVeBAHaJ4?rs=1&pid=ImgDetMain&o=7&rm=3"),
          CategoryListView(
            categoryList: [
              Categories(
                id: 1,
                name: "burger",
                imageUrl:
                    "https://th.bing.com/th/id/OIP.uPJNhmsCGP72JL72DmMLfwHaE8?w=223&h=180&c=7&r=0&o=7&pid=1.7&rm=3",
              ),
              Categories(
                id: 2,
                name: "burger",
                imageUrl:
                    "https://th.bing.com/th/id/OIP.uPJNhmsCGP72JL72DmMLfwHaE8?w=223&h=180&c=7&r=0&o=7&pid=1.7&rm=3",
              ),
              Categories(
                id: 3,
                name: "burger",
                imageUrl:
                    "https://th.bing.com/th/id/OIP.uPJNhmsCGP72JL72DmMLfwHaE8?w=223&h=180&c=7&r=0&o=7&pid=1.7&rm=3",
              ),
              Categories(
                id: 3,
                name: "burger",
                imageUrl:
                    "https://th.bing.com/th/id/OIP.uPJNhmsCGP72JL72DmMLfwHaE8?w=223&h=180&c=7&r=0&o=7&pid=1.7&rm=3",
              ),
              Categories(
                id: 3,
                name: "burger",
                imageUrl:
                    "https://th.bing.com/th/id/OIP.uPJNhmsCGP72JL72DmMLfwHaE8?w=223&h=180&c=7&r=0&o=7&pid=1.7&rm=3",
              ),
            ],
          ),
          Divider(
            color: Theme.of(context).colorScheme.outline.withAlpha(50),
            thickness: 8.h,
            height: 8.h,
          ),
          NearHotelsWidget(),
        ],
      ),
    );
  }

  TextField buildsearchBar() {
    return TextField(
      decoration: AppInputDecoration.auth(
        prefixText: "Food , groceries , drink ... ",
        prefixIcon: Icon(Icons.search_rounded),
        suffix: Container(
          padding: AppEdgeInsets.allS,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: AppBorderRadius.m,
          ),
          child: SvgPicture.asset(Assets.svgs.filter.path),
        ).pAllS,
      ),
    );
  }
}
