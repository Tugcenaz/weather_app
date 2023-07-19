import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle generalWhiteTextStyle1(
      {Color? color, FontWeight? fontWeight, double? fontSize}) {
    return GoogleFonts.overpass(
        shadows: [const Shadow(blurRadius: 20, offset: Offset(1, 5))],
        fontSize: fontSize ?? 24.sp,
        color: color ?? Colors.white,
        fontWeight: fontWeight ?? FontWeight.w700,
        height: 1.3,
        letterSpacing: 1.1);
  }

  static TextStyle generalWhiteTextStyle2(
      {Color? color, FontWeight? fontWeight, double? fontSize}) {
    return GoogleFonts.overpass(
        shadows: [const Shadow(blurRadius: 90, offset: Offset(0, 6))],
        fontSize: fontSize ?? 86.sp,
        color: color ?? Colors.white,
        fontWeight: fontWeight ?? FontWeight.w500,
        height: 1.3,
        letterSpacing: 1.1);
  }

  static TextStyle generalWhiteTextStyle3(
      {Color? color, FontWeight? fontWeight, double? fontSize}) {
    return GoogleFonts.overpass(
        fontSize: fontSize ?? 20.sp,
        color: color ?? Colors.white,
        fontWeight: fontWeight ?? FontWeight.w400,
        height: 1.3,
        letterSpacing: 1);
  }
}
