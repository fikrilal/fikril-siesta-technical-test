import 'package:fikril_siesta_technical_test/_core/presentation/component/colors/brand_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/size/font_size.dart';
import '../colors/slate_color.dart';

class TextFieldComponent extends StatelessWidget {
  final String hintText;
  final Widget? icon;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onSubmitted;
  final FocusNode? focusNode;
  final bool isObscure;
  final bool isEnabled;
  final Color? fillColor;
  final Color? borderColor;
  final Color? textColor;
  final double? borderWidth;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final double borderRadius;
  final int maxLines;

  const TextFieldComponent({
    super.key,
    required this.hintText,
    this.icon,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.onSubmitted,
    this.focusNode,
    this.isObscure = false,
    this.isEnabled = true,
    this.fillColor,
    this.borderColor,
    this.textColor,
    this.borderWidth = 1.0,
    this.textStyle,
    this.hintStyle,
    this.borderRadius = 8.0,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onSubmitted: onSubmitted,
      focusNode: focusNode,
      obscureText: isObscure,
      enabled: isEnabled,
      style: textStyle ?? GoogleFonts.interTight(
        fontSize: FontSize.small,
        fontWeight: FontWeight.w400,
        color: Slate.slate900,
      ),
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle ?? GoogleFonts.interTight(
          fontSize: FontSize.small,
          fontWeight: FontWeight.w400,
          color: Slate.slate500,
        ),
        prefixIcon: icon != null ? Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 10.0),
          child: icon is IconData ? Icon(icon as IconData, color: textColor) : icon as Widget,
        ) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor ?? Slate.slate300,
            width: borderWidth!,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor ?? Slate.slate300,
            width: borderWidth!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor ?? Brand.secondary,
            width: borderWidth!,
          ),
        ),
        filled: true,
        fillColor: fillColor ?? Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
      ),
    );
  }
}