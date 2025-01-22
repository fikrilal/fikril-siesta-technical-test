import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../_core/presentation/component/colors/slate_color.dart';
import '../../../_core/presentation/component/icons/icons_library.dart';
import '../../../_core/presentation/component/typography/typography.dart';

class ActionSheet extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ActionSheet({
    super.key,
    required this.onEdit,
    required this.onDelete,
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
          SizedBox(height: 16.h),
          ZoomTapAnimation(
            onTap: onEdit,
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Row(
                children: [
                  const Icon(
                    Icons.edit,
                    color: Slate.slate900,
                  ),
                  SizedBox(width: 16.w),
                  TypographyStyles.bodyMainMedium(
                    'Edit Task',
                    color: Slate.slate900,
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: Slate.slate200,
            height: 1.h,
            thickness: 1.h,
          ),
          ZoomTapAnimation(
            onTap: onDelete,
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Row(
                children: [
                  const Icon(
                    Icons.delete_forever,
                    color: Slate.slate900,
                  ),
                  SizedBox(width: 16.w),
                  TypographyStyles.bodyMainMedium(
                    'Hapus Task',
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
