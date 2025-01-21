import 'package:fikril_siesta_technical_test/_core/presentation/component/colors/green_color.dart';
import 'package:fikril_siesta_technical_test/_core/presentation/component/colors/slate_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../_core/presentation/component/icons/icons_library.dart';
import '../../../_core/utils/size/font_size.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    final Color selectedColor =
        Theme.of(context).bottomNavigationBarTheme.selectedItemColor ?? Green.fromDesign;
    final Color unselectedColor =
        Theme.of(context).bottomNavigationBarTheme.unselectedItemColor ?? Slate.slate500;

    return Container(
      decoration: BoxDecoration(border: Border(top: BorderSide(color: Slate.slate200, width: 1.w))),
      child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: CustomIcons.homeOutline(
                color: selectedIndex == 0 ? selectedColor : unselectedColor,
                size: 20.w,
              ),
              activeIcon: CustomIcons.homeBold(color: selectedColor, size: 20.w),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: CustomIcons.bagOutline(
                color: selectedIndex == 1 ? selectedColor : unselectedColor,
                size: 20.w,
              ),
              activeIcon: CustomIcons.bagBold(color: selectedColor, size: 20.w),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: CustomIcons.bookmarkOutline(
                color: selectedIndex == 2 ? selectedColor : unselectedColor,
                size: 20.w,
              ),
              activeIcon: CustomIcons.bookmarkBold(color: selectedColor, size: 20.w),
              label: 'Bookmark',
            ),
            BottomNavigationBarItem(
              icon: CustomIcons.profileOutline(
                color: selectedIndex == 3 ? selectedColor : unselectedColor,
                size: 20.w,
              ),
              activeIcon: CustomIcons.profileBold(color: selectedColor, size: 20.w),
              label: 'Profile',
            ),
          ],
          elevation: 0,
          currentIndex: selectedIndex,
          selectedItemColor: Green.fromDesign,
          unselectedItemColor: Slate.slate500,
          onTap: onTabChange,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          unselectedLabelStyle: GoogleFonts.interTight(
              fontSize: FontSize.xxsmall, fontWeight: FontWeight.w500, color: Slate.slate500, height: 1.8),
          selectedLabelStyle: GoogleFonts.interTight(
              fontSize: FontSize.xxsmall, fontWeight: FontWeight.w600, color: Green.fromDesign, height: 1.8)),
    );
  }
}
