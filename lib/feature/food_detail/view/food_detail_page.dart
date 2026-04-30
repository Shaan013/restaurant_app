import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/data/models/responses/Food.dart';
import 'package:restaurant_app/data/models/responses/Food_model.dart';
import 'package:restaurant_app/data/models/responses/Recommended.dart';
import 'package:restaurant_app/data/store/food_detail_store.dart';
import 'package:restaurant_app/feature/food_detail/widgets/food_page_observer.dart';
import 'package:restaurant_app/values/extensions/app_padding_ext.dart';
import 'package:restaurant_app/values/theme/app_border_radius.dart';
import 'package:restaurant_app/values/theme/app_colors.dart';
import 'package:restaurant_app/values/theme/app_edge_insets.dart';
import 'package:restaurant_app/widgets/add_to_white_list_icon.dart';
import 'package:restaurant_app/widgets/app_network_image.dart';
import 'package:restaurant_app/widgets/lable_row_widget.dart';

import '../../../generated/assets.dart';
import '../../../widgets/recommended_widget.dart';

@RoutePage()
class FoodDetailPage extends StatefulWidget {
  final int id;

  const FoodDetailPage({super.key, required this.id});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  FoodPageStore foodPageStore = FoodPageStore();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foodPageStore.featchFoodInfo(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FoodPageObserver(
        modelStore: foodPageStore,
        showData: buildfoodDetails,
      ),
    );
  }

  SingleChildScrollView buildfoodDetails(FoodModel foods) {
    final Food food = foods.food!;

    return SingleChildScrollView(
      child: Column(
        children: [
          buildTopPart(context, food.imageUrl ?? "unknow"),
          buildBottomPart(context, food).pAllM,
        ],
      ),
    );
  }

  Column buildBottomPart(BuildContext context, Food food) {
    final List<String> tegList = food.tags ?? [];
    return Column(
      crossAxisAlignment: .start,
      spacing: 8.h,
      children: [
        SingleChildScrollView(
          scrollDirection: .horizontal,
          child: Row(
            mainAxisSize: .max,
            mainAxisAlignment: .start,
            spacing: 8.w,
            children: tegList
                .map((item) => buildChip(context, tag: item))
                .toList(),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                food.title ?? "unknow",
                style: TextTheme.of(context).headlineMedium,
                maxLines: 2,
              ),
            ),
            addToWhiteListIcon(isSelected: true),
          ],
        ),
        Row(
          spacing: 8.w,
          children: [
            getLableRow(
              svgUrl: Assets.svgs.locationNorth.path,
              text: "${food.distance} away from you ",
              textStyle: TextTheme.of(context).titleMedium,
            ),
            getLableRow(
              svgUrl: Assets.svgs.vector1.path,
              text: "${food.rating} (${food.reviewsCount}+ Reviwes) ",
              textStyle: TextTheme.of(context).titleMedium,
            ),
          ],
        ),
        Text(
          "\$ ${food.price} /per plate ",
          style: TextTheme.of(context).headlineSmall,
        ),

        buildtabs(dic: food.description ?? "unknow"),
        RecommendedWidget(
          recList: food.recommended ??[],
        ),
      ],
    );
  }

  SizedBox buildtabs({required String dic}) {
    return SizedBox(
      height: 250.h,
      child: DefaultTabController(
        length: 2,
        child: Column(
          mainAxisSize: .min,
          children: [
            TabBar(
              tabs: [
                Tab(text: "Description"),
                Tab(text: "Reviews & Others"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Text(dic, maxLines: 7),
                  Center(child: Text("data2")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildChip(BuildContext context, {required String tag}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.grey.withAlpha(40),
        borderRadius: AppBorderRadius.xxxl,
      ),
      child: Text(tag, style: TextTheme.of(context).titleMedium),
    );
  }

  Stack buildTopPart(BuildContext context, String url) {
    return Stack(
      children: [
        AppNetworkImage(url: url),

        AppBar(
          leading: GestureDetector(
            onTap: () {
              context.router.pop();
            },
            child: buildicons(context, icons: Icons.arrow_back).pl(12.w),
          ),
          backgroundColor: Colors.transparent,
          actions: [buildicons(context, icons: Icons.more_vert).pr(12.w)],
        ),
      ],
    );
  }

  CircleAvatar buildicons(BuildContext context, {required IconData icons}) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Icon(icons, color: Theme.of(context).colorScheme.outline),
    );
  }
}
