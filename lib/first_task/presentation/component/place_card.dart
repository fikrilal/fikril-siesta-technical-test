import 'package:fikril_siesta_technical_test/_core/presentation/component/colors/yellow_color.dart';
import 'package:fikril_siesta_technical_test/_core/presentation/component/icons/icons_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../_core/presentation/component/colors/slate_color.dart';
import '../../../_core/presentation/component/typography/typography.dart';

class PlaceCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final double distance;
  final double rating;
  final int reviewCount;

  const PlaceCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.distance,
    required this.rating,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TypographyStyles.bodyMainBold(
                  title,
                  color: Slate.slate800,
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    TypographyStyles.bodyCaptionMedium(
                      '${distance.toStringAsFixed(1)} km',
                      color: Slate.slate500,
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      width: 4.w,
                      height: 4.h,
                      decoration: const BoxDecoration(
                        color: Slate.slate500,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    CustomIcons.starsBold(size: 16.w, color: Yellow.yellow400),
                    SizedBox(width: 4.w),
                    TypographyStyles.bodyCaptionMedium(
                      '$rating reviews',
                      color: Slate.slate500,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
