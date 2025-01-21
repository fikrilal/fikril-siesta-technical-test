import 'package:fikril_siesta_technical_test/_core/presentation/component/colors/green_color.dart';
import 'package:fikril_siesta_technical_test/_core/presentation/component/colors/slate_color.dart';
import 'package:fikril_siesta_technical_test/_core/presentation/component/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerItem extends StatelessWidget {
  final String title;
  final String buttonText;
  final String imagePath;
  final VoidCallback onPressed;
  final int currentIndex;
  final int totalBanners;

  const BannerItem({
    super.key,
    required this.title,
    required this.buttonText,
    required this.imagePath,
    required this.onPressed,
    required this.currentIndex,
    required this.totalBanners,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TypographyStyles.bodyMainBold(
                  title,
                  maxLines: 3,
                  height: 1.3,
                  color: Slate.slate100,
                ),
                SizedBox(height: 8.h),
                ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                  ),
                  child: TypographyStyles.bodyCaptionBold(
                    buttonText,
                    color: Slate.slate100,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10.0,
            right: 10.0,
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100.r)
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(totalBanners, (index) {
                  return Container(
                    width: 16.w,
                    height: 8.h,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: index == currentIndex
                          ? Green.fromDesign
                          : Slate.slate300,
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
