import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../_core/presentation/component/colors/slate_color.dart';
import '../../../_core/presentation/component/typography/typography.dart';
import 'category_item.dart';

class TopCategories extends StatelessWidget {
  final List<Category> categories;

  const TopCategories({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TypographyStyles.bodyLargeBold('Top Categories'),
            TypographyStyles.bodyCaptionMedium(
              'See all',
              color: Slate.slate400,
            ),
          ],
        ),
        SizedBox(height: 20.h),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 16.w,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return CategoryItem(
              title: category.title,
              imagePath: category.imagePath,
            );
          },
        ),
      ],
    );
  }
}
