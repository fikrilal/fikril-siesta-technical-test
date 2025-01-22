import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../_core/presentation/component/colors/slate_color.dart';
import '../../../_core/presentation/component/typography/typography.dart';

class FilterSheet extends StatelessWidget {
  final VoidCallback onShowAll;
  final VoidCallback onShowCompleted;
  final VoidCallback onShowPending;

  const FilterSheet({
    super.key,
    required this.onShowAll,
    required this.onShowCompleted,
    required this.onShowPending,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              margin: EdgeInsets.only(bottom: 16.h),
              decoration: BoxDecoration(
                color: Slate.slate300,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          ZoomTapAnimation(
            onTap: onShowAll,
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Row(
                children: [
                  const Icon(Icons.filter_list, color: Slate.slate900),
                  SizedBox(width: 16.w),
                  TypographyStyles.bodyMainMedium(
                    'Show All',
                    color: Slate.slate900,
                  ),
                ],
              ),
            ),
          ),
          Divider(color: Slate.slate200, height: 1.h, thickness: 1.h),
          ZoomTapAnimation(
            onTap: onShowCompleted,
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Row(
                children: [
                  const Icon(Icons.done, color: Slate.slate900),
                  SizedBox(width: 16.w),
                  TypographyStyles.bodyMainMedium(
                    'Show Completed',
                    color: Slate.slate900,
                  ),
                ],
              ),
            ),
          ),
          Divider(color: Slate.slate200, height: 1.h, thickness: 1.h),
          ZoomTapAnimation(
            onTap: onShowPending,
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Row(
                children: [
                  const Icon(Icons.pending, color: Slate.slate900),
                  SizedBox(width: 16.w),
                  TypographyStyles.bodyMainMedium(
                    'Show Pending',
                    color: Slate.slate900,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
