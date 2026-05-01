import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:restaurant_app/core/db/hive/hive_service.dart';
import 'package:restaurant_app/core/db/hive/white_list.dart';
import 'package:restaurant_app/core/locator/main_locator.dart';
import 'package:restaurant_app/router/app_route.dart';
import 'package:restaurant_app/values/extensions/app_padding_ext.dart';
import 'package:restaurant_app/values/theme/app_colors.dart';
import 'package:restaurant_app/values/theme/app_edge_insets.dart';
import 'package:restaurant_app/widgets/app_section_widget.dart';
import 'package:restaurant_app/widgets/show_case_card_widget.dart';

import '../data/models/responses/Food.dart';
import '../data/models/responses/NearbyHotels.dart';
import '../data/models/responses/Recommended.dart';
import 'cart_product_quantity_widget.dart';

class RecommendedWidget extends StatefulWidget {
  final List<Recommended> recList;
  final String? title;
  final String? subtitle;

  const RecommendedWidget({
    super.key,
    required this.recList,
    this.title,
    this.subtitle,
  });

  @override
  State<RecommendedWidget> createState() => _RecommendedWidgetState();
}

class _RecommendedWidgetState extends State<RecommendedWidget> {
  @override
  Widget build(BuildContext context) {
    return AppSectionWidget(
      name: widget.title ?? "Recommended you",
      subtitle: widget.title ?? "Explore best items and enjoy your meal",
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
          final bool isWhite = HiveService.checkIsIt(food.id);
          return Stack(
            children: [
              Column(
                mainAxisSize: .min,
                crossAxisAlignment: .start,
                children: [
                  Flexible(
                    child: ValueListenableBuilder(
                      valueListenable: Hive.box<WhiteList>(
                        HiveService.whiteListBox,
                      ).listenable(),
                      builder:
                          (
                            BuildContext context,
                            Box<dynamic> value,
                            Widget? child,
                          ) {
                            return ShowCaseCardWidget(
                              isItWhiteList: HiveService.checkIsIt(food.id),
                              onTap: () => handleProjectTap(food.id!),
                              onAddWhite: () {
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
                            );
                          },
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
              ).phS,
              Positioned(
                bottom: 10.h,
                right: 10.w,
                child: ValueListenableBuilder(
                  valueListenable: Hive.box<WhiteList>(
                    HiveService.cartListBox,
                  ).listenable(),
                  builder: (BuildContext context, value, Widget? child) {
                    final int isCart = HiveService.chackCArt(food.id!);
                    print(" count ${isCart}");

                    return buildQuantityCounter(
                      food,
                      (isCart != 0),
                      context,
                      isCart,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void handleProjectTap(int id) {
    print("object : ${id}");
    context.router.push(FoodDetailRoute(id: id));
  }

  Visibility buildQuantityCounter(
    Recommended recommended,
    bool isInCart,
    BuildContext context,
    int currentQuantity,
  ) {
    return Visibility(
      visible: !isInCart,
      replacement: quantityCountContainer(
        context,
        quantity: currentQuantity,
        productCout: 0,
        onIncreement: () =>
            HiveService.getCart(recommended, isIncreement: true),
        onDcrement: () => HiveService.getCart(recommended, isIncreement: false),
      ),
      child: addCountButton(
        context,
        addToCart: () {
          HiveService.addToCart(recommended);
        },
      ),
    );
  }

  Widget addCountButton(
    BuildContext context, {
    required VoidCallback addToCart,
  }) {
    return GestureDetector(
      onTap: addToCart,
      child: Container(
        padding: AppEdgeInsets.allS,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.fededWhite,
        ),
        child: const Icon(Icons.add, size: 24),
      ),
    );
  }
}
