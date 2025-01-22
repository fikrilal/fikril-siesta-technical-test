import 'package:fikril_siesta_technical_test/_core/presentation/component/carousel/banner_item.dart';
import 'package:fikril_siesta_technical_test/_core/presentation/component/colors/brand_color.dart';
import 'package:fikril_siesta_technical_test/_core/presentation/component/colors/green_color.dart';
import 'package:fikril_siesta_technical_test/_core/presentation/component/colors/slate_color.dart';
import 'package:fikril_siesta_technical_test/_core/presentation/component/typography/typography.dart';
import 'package:fikril_siesta_technical_test/_core/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ZoomTapAnimation(
                onTap: () {
                  Get.toNamed(Routes.homeScreen);
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: Slate.slate900,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: TypographyStyles.h5(
                      'First Task',
                      color: Slate.slate100,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              ZoomTapAnimation(
                onTap: () {
                  Get.toNamed(Routes.productListScreen);
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: Slate.slate900,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: TypographyStyles.h5(
                      'Second Task',
                      color: Slate.slate100,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              ZoomTapAnimation(
                onTap: () {
                  Get.toNamed(Routes.toDoListScreen);
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: Slate.slate900,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: TypographyStyles.h5(
                      'Third Task',
                      color: Slate.slate100,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              TypographyStyles.bodyCaptionRegular(
                'Note: long press the card to edit or delete the task',
                color: Slate.slate500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
