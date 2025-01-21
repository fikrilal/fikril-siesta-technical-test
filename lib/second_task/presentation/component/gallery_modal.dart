import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GalleryModal extends StatelessWidget {
  final List<String> images;

  const GalleryModal({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.3,
      maxChildSize: 0.9,
      builder: (_, controller) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Container(
              height: 4.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                controller: controller,
                itemCount: images.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: CachedNetworkImage(
                        imageUrl: images[index],
                        placeholder: (context, url) => const Center(
                          child: CupertinoActivityIndicator(),
                        ),
                        errorWidget: (context, url, error) => const Icon(
                          CupertinoIcons.exclamationmark_circle,
                          color: CupertinoColors.systemRed,
                          size: 30,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
