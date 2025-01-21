import 'package:fikril_siesta_technical_test/_core/presentation/component/colors/brand_color.dart';
import 'package:fikril_siesta_technical_test/_core/presentation/component/colors/slate_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/size/font_size.dart';

class SearchBarComponent extends StatelessWidget {
  final String hintText;

  const SearchBarComponent({
    super.key,
    this.hintText = 'Search menu, restaurant or etc',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: Slate.slate600,
        ),
        suffixIcon: const Icon(
          Icons.tune,
          color: Slate.slate600,
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.interTight(
          fontSize: FontSize.small,
          fontWeight: FontWeight.w400,
          color: Slate.slate700,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Slate.slate300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Slate.slate300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Brand.primary),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      ),
    );
  }
}
