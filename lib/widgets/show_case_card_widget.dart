import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_app/data/models/responses/NearbyHotels.dart';
import '../generated/assets.dart';
import '../values/extensions/app_padding_ext.dart';
import '../values/theme/app_border_radius.dart';
import '../values/theme/app_colors.dart';
import 'app_network_image.dart';

class ShowCaseCardWidget extends StatelessWidget {
  final NearbyHotels hotel;
  final double? imageAspectRatio;

  const ShowCaseCardWidget({
    super.key,
    required this.hotel,
    this.imageAspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Column(
      crossAxisAlignment: .start,
      children: [
        Flexible(child: buildImage(hotel.imageUrl)),
        Text(hotel.title ?? "UNKNOW", style: textTheme.headlineSmall),
        getLableRow(
          svgUrl: Assets.svgs.locationNorth.path,
          text: hotel.reviewsCount.toString(),
        ),
        getLableRow(
          svgUrl: Assets.svgs.vector1.path,
          text: "${hotel.rating}  review",
        ),
      ],
    );
  }

  Stack buildImage(String? url) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: AppBorderRadius.m,
          child: AppNetworkImage(aspectRatio: imageAspectRatio, url: url),
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

  Widget getLableRow({required String svgUrl, required String text}) {
    return Row(
      spacing: 8.w,
      mainAxisSize: .min,
      children: [SvgPicture.asset(svgUrl), Text(text)],
    );
  }
}
