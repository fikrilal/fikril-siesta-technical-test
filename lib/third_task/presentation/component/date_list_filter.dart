import 'package:fikril_siesta_technical_test/_core/presentation/component/colors/brand_color.dart';
import 'package:fikril_siesta_technical_test/_core/presentation/component/colors/slate_color.dart';
import 'package:fikril_siesta_technical_test/_core/presentation/component/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class DateListFilter extends StatefulWidget {
  final DateTime? initialDate;
  final ValueChanged<DateTime> onDateSelected;
  final Color? selectedColor;
  final Color? unselectedColor;

  const DateListFilter({
    super.key,
    this.initialDate,
    required this.onDateSelected,
    this.selectedColor,
    this.unselectedColor,
  });

  @override
  State<DateListFilter> createState() => _DateListFilterState();
}

class _DateListFilterState extends State<DateListFilter> {
  late ScrollController _scrollController;
  late DateTime _currentDate;
  late List<DateTime> _dates;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _currentDate = widget.initialDate ?? DateTime.now();
    _generateDates();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToCurrentDate();
    });
  }

  void _generateDates() {
    final now = DateTime.now();
    final firstDayOfMonth = DateTime(now.year, now.month, 1);
    final lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
    final daysInMonth = lastDayOfMonth.day;

    _dates = List.generate(daysInMonth, (index) => firstDayOfMonth.add(Duration(days: index)));
  }

  void _scrollToCurrentDate() {
    final currentIndex = _dates.indexWhere((date) =>
    date.day == _currentDate.day && date.month == _currentDate.month && date.year == _currentDate.year);
    if (currentIndex != -1) {
      const itemWidth = 80.0;
      final screenWidth = MediaQuery.of(context).size.width;
      final offset = currentIndex * itemWidth - (screenWidth / 2 - itemWidth / 2);
      _scrollController.jumpTo(offset.clamp(0.0, _scrollController.position.maxScrollExtent));
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: _dates.length,
        itemBuilder: (context, index) {
          final date = _dates[index];
          final isSelected = date.day == _currentDate.day &&
              date.month == _currentDate.month &&
              date.year == _currentDate.year;

          return ZoomTapAnimation(
            onTap: () {
              setState(() {
                _currentDate = date;
              });
              widget.onDateSelected(date);
            },
            child: Container(
              width: 60.w,
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                color: isSelected
                    ? widget.selectedColor ?? Brand.secondary
                    : widget.unselectedColor ?? Slate.slate100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TypographyStyles.bodyCaptionRegular(
                    DateFormat('E').format(date),
                    color: isSelected ? Colors.white : Slate.slate600,
                  ),
                  const SizedBox(height: 4),
                  TypographyStyles.h5(
                    DateFormat('d').format(date),
                    color: isSelected ? Colors.white : Slate.slate600,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
