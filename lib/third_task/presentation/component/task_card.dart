import 'package:fikril_siesta_technical_test/_core/presentation/component/colors/brand_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../_core/presentation/component/colors/red_color.dart';
import '../../../_core/presentation/component/colors/slate_color.dart';
import '../../../_core/presentation/component/typography/typography.dart';
import 'circle_checkbox.dart';

class TaskCard extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  final String title;
  final String description;
  final bool status;

  const TaskCard({
    super.key,
    required this.onTap,
    this.onLongPress,
    required this.title,
    required this.description,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      onLongTap: onLongPress,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: status ? Brand.secondary.withOpacity(0.05) : Slate.slate100,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TypographyStyles.bodyMainMedium(
                    title,
                    color: Slate.slate900,
                  ),
                  SizedBox(height: 6.h),
                  TypographyStyles.bodyCaptionRegular(
                    description,
                    color: Slate.slate600,
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: status ? Brand.secondary.withOpacity(0.2) : Red.red200,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: TypographyStyles.captionSmall(
                      fontWeight: FontWeight.w600,
                      status ? 'Selesai' : 'Belum Selesai',
                      color: status ? Brand.secondary : Red.red700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            CircleCheckbox(
              isChecked: status,
              onChanged: (value) {
                onTap();
              },
            ),
          ],
        ),
      ),
    );
  }
}
