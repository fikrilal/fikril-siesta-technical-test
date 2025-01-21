import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../_core/presentation/component/colors/slate_color.dart';
import '../../../_core/presentation/component/typography/typography.dart';

class Category {
  final String title;
  final String imagePath;

  Category({required this.title, required this.imagePath});
}

class CategoryItem extends StatelessWidget {
  final String title;
  final String imagePath;

  const CategoryItem({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 64.w,
          height: 64.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        TypographyStyles.bodyCaptionMedium(
          title,
          fontWeight: FontWeight.w600,
          color: Slate.slate800,
        ),
      ],
    );
  }
}
