import 'package:fikril_siesta_technical_test/_core/presentation/component/colors/slate_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CircleCheckbox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const CircleCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        onChanged(!isChecked);
      },
      child: Container(
        width: 24.w,
        height: 24.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isChecked ? Slate.slate900 : Slate.slate300,
            width: 1.5,
          ),
        ),
        child: isChecked
            ? Lottie.asset(
                'assets/icons/checkmark2.json',
                repeat: false,
                fit: BoxFit.fill,
                height: 24.h,
                width: 24.w,
              )
            : null,
      ),
    );
  }
}
