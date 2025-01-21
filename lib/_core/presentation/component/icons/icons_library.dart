import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'icons_default.dart';

class CustomIcons {
  static const String _iconPath = 'assets/icons/';

  static SvgPicture getIcon(
    String fileName, {
    double? size,
    Color? color,
  }) {
    return SvgPicture.asset(
      '$_iconPath$fileName.svg',
      width: size ?? IconDefaults.defaultWidth,
      height: size ?? IconDefaults.defaultHeight,
      colorFilter: ColorFilter.mode(
        color ?? IconDefaults.defaultColor,
        BlendMode.srcIn,
      ),
      fit: BoxFit.contain,
    );
  }

  static SvgPicture arrowDown({double? size, Color? color}) =>
      getIcon('arrow_down', size: size, color: color);

  static SvgPicture arrowRight({double? size, Color? color}) =>
      getIcon('arrow_right', size: size, color: color);

  static SvgPicture commentSpeech({double? size, Color? color}) =>
      getIcon('comment_speech', size: size, color: color);

  static SvgPicture envelopeOpen({double? size, Color? color}) =>
      getIcon('envelope_open', size: size, color: color);

  static SvgPicture shoppingCart({double? size, Color? color}) =>
      getIcon('shopping_cart', size: size, color: color);

  static SvgPicture calendarDate({double? size, Color? color}) =>
      getIcon('calendar_date', size: size, color: color);
}
