import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProductSkeleton extends StatelessWidget {
  const ProductSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  width: constraints.maxWidth,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 80.w,
                height: 24.h,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6.r)),
              ),
              Container(
                width: 80.w,
                height: 24.h,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6.r)),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Container(
            width: double.infinity,
            height: 24.h,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6.r)),
          ),
          SizedBox(height: 4.h),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: 24.h,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6.r)),
          ),
        ],
      ),
    );
  }
}
