import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../_core/presentation/component/colors/brand_color.dart';
import '../../../_core/presentation/component/colors/slate_color.dart';
import '../../../_core/presentation/component/typography/typography.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String price;
  final String title;
  final String description;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.price,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) => const Center(
                  child: CupertinoActivityIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(
                  CupertinoIcons.exclamationmark_circle,
                  color: CupertinoColors.systemRed,
                  size: 30,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TypographyStyles.bodyLargeBold(
                price,
                color: Brand.primary,
              ),
              ZoomTapAnimation(
                onTap: onTap,
                child: TypographyStyles.bodyCaptionMedium(
                  'View gallery',
                  color: CupertinoColors.activeBlue,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          TypographyStyles.bodyMainMedium(
            title,
            color: Slate.slate900,
          ),
          SizedBox(height: 6.h),
          TypographyStyles.bodyCaptionRegular(
            description,
            maxLines: 2,
            height: 1.4,
          ),
        ],
      ),
    );
  }
}
