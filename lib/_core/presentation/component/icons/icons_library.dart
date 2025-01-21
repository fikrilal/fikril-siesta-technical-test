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

  static SvgPicture bellNotificationOutline({double? size, Color? color}) =>
      getIcon('mdi_bell-notification-outline', size: size, color: color);

  static SvgPicture equalizerFill({double? size, Color? color}) =>
      getIcon('ri_equalizer-fill', size: size, color: color);

  static SvgPicture mapPin5Line({double? size, Color? color}) =>
      getIcon('ri_map-pin-5-line', size: size, color: color);

  static SvgPicture searchLine({double? size, Color? color}) =>
      getIcon('ri_search-line', size: size, color: color);

  static SvgPicture arrowDown({double? size, Color? color}) =>
      getIcon('ri_arrow-drop-down-fill', size: size, color: color);

  static SvgPicture homeOutline({double? size, Color? color}) =>
      getIcon('home-outline', size: size, color: color);

  static SvgPicture homeBold({double? size, Color? color}) =>
      getIcon('home-bold', size: size, color: color);
  static SvgPicture bagOutline({double? size, Color? color}) =>
      getIcon('bag-outline', size: size, color: color);

  static SvgPicture bagBold({double? size, Color? color}) =>
      getIcon('bag-bold', size: size, color: color);

  static SvgPicture profileOutline({double? size, Color? color}) =>
      getIcon('profile-outline', size: size, color: color);

  static SvgPicture profileBold({double? size, Color? color}) =>
      getIcon('profile-bold', size: size, color: color);

  static SvgPicture bookmarkOutline({double? size, Color? color}) =>
      getIcon('bookmark-outline', size: size, color: color);

  static SvgPicture bookmarkBold({double? size, Color? color}) =>
      getIcon('bookmark-bold', size: size, color: color);

  static SvgPicture starsBold({double? size, Color? color}) =>
      getIcon('stars-bold', size: size, color: color);
}
