import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'banner_item.dart';

class CarouselBanner extends StatefulWidget {
  final List<Map<String, dynamic>> banners;

  const CarouselBanner({super.key, required this.banners});

  @override
  CarouselBannerState createState() => CarouselBannerState();
}

class CarouselBannerState extends State<CarouselBanner> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: widget.banners.length,
      itemBuilder: (context, index, realIndex) {
        final bannerData = widget.banners[index];
        return BannerItem(
          title: bannerData['title'] as String,
          buttonText: bannerData['buttonText'] as String,
          imagePath: bannerData['imagePath'] as String,
          onPressed: bannerData['onPressed'] as VoidCallback,
          currentIndex: index,
          totalBanners: widget.banners.length,
        );
      },
      options: CarouselOptions(
        height: 160.h,
        viewportFraction: 1.0,
        autoPlay: true,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
