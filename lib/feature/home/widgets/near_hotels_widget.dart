import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_app/values/extensions/app_padding_ext.dart';
import 'package:restaurant_app/values/theme/app_border_radius.dart';
import 'package:restaurant_app/values/theme/app_colors.dart';
import 'package:restaurant_app/widgets/app_network_image.dart';

import '../../../generated/assets.dart';

class NearHotelsWidget extends StatelessWidget {
  const NearHotelsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Column(
      crossAxisAlignment: .start,
      children: [
        buildTitle(textTheme),
        Text(
          "Exclusive restaurants deals near you",
          style: textTheme.bodyLarge,
          maxLines: 1,
        ),
        SizedBox(
          height: 250.h,
          child: ListView.builder(
            scrollDirection: .horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: .start,
                children: [
                  Expanded(child: buildImage()),
                  Text(
                    "Egg Benedict with Capsicum",
                    style: textTheme.headlineSmall,
                  ),
                  getLableRow(
                    svgUrl: Assets.svgs.locationNorth.path,
                    text: "adfadf",
                  ),
                  getLableRow(svgUrl: Assets.svgs.vector1.path, text: "adfadf"),
                ],
              ).phM;
            },
          ),
        ),
      ],
    ).pAllM;
  }

  Stack buildImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: AppBorderRadius.m,
          child: AppNetworkImage(
            // width: 220.w,
            url:
                "https://tse1.mm.bing.net/th/id/OIP.JaXsqtUtPHL_X5e3iNjfzgHaE8?w=3000&h=2000&rs=1&pid=ImgDetMain&o=7&rm=3",
          ),
        ),
        Positioned(
          top: 10.h,
          left: 10.h,
          child: CircleAvatar(
            backgroundColor: AppColors.white,
            child: SvgPicture.asset(Assets.svgs.heart.path),
          ),
        ),
      ],
    );
  }

  Row buildTitle(TextTheme textTheme) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Nearby hotels",
            style: textTheme.headlineMedium,
            maxLines: 1,
          ),
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

  Widget getLableRow({required String svgUrl, required String text}) {
    return Row(
      spacing: 8.w,
      mainAxisSize: .min,
      children: [SvgPicture.asset(svgUrl), Text(text)],
    );
  }
}
