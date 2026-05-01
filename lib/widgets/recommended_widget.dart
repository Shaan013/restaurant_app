import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/core/db/hive/hive_service.dart';
import 'package:restaurant_app/core/locator/main_locator.dart';
import 'package:restaurant_app/router/app_route.dart';
import 'package:restaurant_app/values/extensions/app_padding_ext.dart';
import 'package:restaurant_app/values/theme/app_colors.dart';
import 'package:restaurant_app/widgets/app_section_widget.dart';
import 'package:restaurant_app/widgets/show_case_card_widget.dart';

import '../data/models/responses/Food.dart';
import '../data/models/responses/NearbyHotels.dart';
import '../data/models/responses/Recommended.dart';

class RecommendedWidget extends StatefulWidget {
  final List<Recommended> recList;

  const RecommendedWidget({super.key, required this.recList});

  @override
  State<RecommendedWidget> createState() => _RecommendedWidgetState();
}

class _RecommendedWidgetState extends State<RecommendedWidget> {
  @override
  Widget build(BuildContext context) {
    return AppSectionWidget(
      name: "Recommended you",
      subtitle: "Explore best items and enjoy your meal",
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: widget.recList.length,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 6.w,
          mainAxisSpacing: 24.h,
          mainAxisExtent: 250.h,
        ),
        itemBuilder: (context, index) {
          final Recommended food = widget.recList[index];
          final bool isWhite=HiveService.checkIsIt(food.id);
          return Column(
            crossAxisAlignment: .start,
            children: [
              Flexible(
                child: ShowCaseCardWidget(
                  onTap: () => handleProjectTap(food.id!),
                  onAddWhite: (){
                   HiveService.toggeleWhishList(food);
                  },
                  imageAspectRatio: 1,
                  hotel: NearbyHotels(
                    id: food.id,
                    title: food.title,
                    reviewsCount: food.reviewsCount,
                    rating: food.rating,
                    imageUrl: food.imageUrl,
                  ),
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "\$ ${food.price ?? 0}",
                  style: TextTheme.of(
                    context,
                  ).headlineSmall!.copyWith(color: AppColors.orange),
                  children: [
                    TextSpan(
                      text: " /per Plate",
                      style: TextTheme.of(context).bodyLarge,
                    ),
                  ],
                ),
              ),
              // Text("\$ 200",style:,),
            ],
          ).phS;
        },
      ),
    );
  }

  void handleProjectTap(int id) {
    print("object : ${id}");
    context.router.push(FoodDetailRoute(id: id));
  }
}
