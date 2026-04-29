import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/data/models/responses/Categories.dart';
import 'package:restaurant_app/values/theme/app_border_radius.dart';
import 'package:restaurant_app/values/theme/app_colors.dart';
import 'package:restaurant_app/values/theme/app_edge_insets.dart';

import '../../../widgets/app_network_image.dart';

class CategoryListView extends StatelessWidget {
  final List<Categories> categoryList;

  const CategoryListView({super.key, required this.categoryList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: ListView.builder(
        scrollDirection: .horizontal,
        shrinkWrap: true,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          final cat = categoryList[index];
          return Column(
            children: [
              Container(
                width: 80,
                height: 80,
                margin: AppEdgeInsets.allM,
                padding: AppEdgeInsets.allM,
                decoration: BoxDecoration(
                  borderRadius: AppBorderRadius.m,
                  color: AppColors.deepGray,
                ),
                // child: Image.network(
                //   errorBuilder: (context, error, stackTrace) {
                //     return Container(
                //       width: .maxFinite,
                //       color: Colors.grey[200],
                //       child: const Icon(Icons.broken_image, color: Colors.grey),
                //     );
                //   },
                //   loadingBuilder: (context, child, loadingProgress) {
                //     if (loadingProgress == null) return child;
                //     return Center(
                //       child: CircularProgressIndicator(
                //         value: loadingProgress.expectedTotalBytes != null
                //             ? loadingProgress.cumulativeBytesLoaded /
                //                   loadingProgress.expectedTotalBytes!
                //             : null,
                //       ),
                //     );
                //   },
                //   "https://tse2.mm.bing.net/th/id/OIP.dJRgtbtpJ827mCUmbDVeBAHaJ4?rs=1&pid=ImgDetMain&o=7&rm=3" ??
                //       "sdfa",
                //   fit: .cover,
                //   headers: const {
                //     'User-Agent':
                //         'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
                //   },
                // ),
                child: AppNetworkImage(
                  url:
                      "https://tse2.mm.bing.net/th/id/OIP.dJRgtbtpJ827mCUmbDVeBAHaJ4?rs=1&pid=ImgDetMain&o=7&rm=3",
                ),
              ),
              Text(cat.name ?? "Unkonw"),
            ],
          );
        },
      ),
    );
  }
}
