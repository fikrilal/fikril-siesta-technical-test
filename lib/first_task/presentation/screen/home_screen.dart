import 'dart:developer';
import 'package:fikril_siesta_technical_test/_core/presentation/component/colors/green_color.dart';
import 'package:fikril_siesta_technical_test/_core/presentation/component/colors/slate_color.dart';
import 'package:fikril_siesta_technical_test/_core/presentation/component/icons/icons_library.dart';
import 'package:fikril_siesta_technical_test/_core/presentation/component/search_bar/search_bar_component.dart';
import 'package:fikril_siesta_technical_test/_core/presentation/component/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../_core/presentation/component/carousel/carousel_banner.dart';
import '../../data/model/place_dummy_data.dart';
import '../../data/model/place_model.dart';
import '../component/bottom_navigation_bar.dart';
import '../component/category_item.dart';
import '../component/place_card.dart';
import '../component/top_categories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 16.h, right: 16.w, left: 16.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: _buildTopSection(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 24.h),
              ),
              const SliverToBoxAdapter(
                child: SearchBarComponent(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 24.h),
              ),
              SliverToBoxAdapter(
                child: _buildCarouselBanner(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 32.h),
              ),
              SliverToBoxAdapter(
                child: _buildTopCategories(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 32.h),
              ),
              SliverToBoxAdapter(
                child: _buildTopDiscount(dummyPlaces),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onTabChange: _onItemTapped,
      ),
    );
  }

  Widget _buildTopSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Green.fromDesign.withOpacity(0.10),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: CustomIcons.mapPin5Line(color: Green.fromDesign),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    TypographyStyles.bodyCaptionRegular(
                      'Current location',
                      color: Slate.slate700,
                    ),
                    SizedBox(width: 4.w),
                    CustomIcons.arrowDown(color: Slate.slate700, size: 24),
                  ],
                ),
                SizedBox(height: 2.h),
                TypographyStyles.bodyMainBold('Jl. Soekarno Hatta 15A'),
              ],
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: Slate.slate200.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: CustomIcons.bellNotificationOutline(color: Slate.slate900),
        ),
      ],
    );
  }

  Widget _buildCarouselBanner() {
    return CarouselBanner(
      banners: [
        {
          'title': 'Claim your \ndiscount 30% \ndaily now!',
          'buttonText': 'Order now',
          'imagePath': 'assets/images/banner.png',
          'onPressed': () {
            log('Order now clicked', name: 'HomeScreen');
          },
        },
        {
          'title': 'Get free \ndelivery on your \nfirst order!',
          'buttonText': 'Order now',
          'imagePath': 'assets/images/banner.png',
          'onPressed': () {
            log('Free delivery clicked', name: 'HomeScreen');
          },
        },
      ],
    );
  }

  Widget _buildTopCategories() {
    final categories = [
      Category(title: 'Beverages', imagePath: 'assets/images/beverages.png'),
      Category(title: 'Snack', imagePath: 'assets/images/snack.png'),
      Category(title: 'Seafood', imagePath: 'assets/images/seafood.png'),
      Category(title: 'Dessert', imagePath: 'assets/images/dessert.png'),
    ];

    return TopCategories(categories: categories);
  }

  Widget _buildTopDiscount(List<Place> places) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TypographyStyles.bodyLargeBold('Top Discount'),
            TypographyStyles.bodyCaptionMedium(
              'See all',
              color: Slate.slate400,
            ),
          ],
        ),
        SizedBox(height: 20.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: places.map((place) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: PlaceCard(
                  imagePath: place.imagePath,
                  title: place.title,
                  distance: place.distance,
                  rating: place.rating,
                  reviewCount: place.reviewCount,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
