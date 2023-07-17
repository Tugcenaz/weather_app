import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle generalWhiteTextStyle1(
      {Color? color, FontWeight? fontWeight, double? fontSize}) {
    return GoogleFonts.overpass(
        shadows: [const Shadow(blurRadius: 25, offset: Offset(1, 10))],
        fontSize: fontSize ?? 24.sp,
        color: color ?? Colors.white,
        fontWeight: fontWeight ?? FontWeight.w600,
        height: 1.3,
        letterSpacing: 1.1);
  }

  static TextStyle generalWhiteTextStyle2(
      {Color? color, FontWeight? fontWeight, double? fontSize}) {
    return GoogleFonts.overpass(
        shadows: [const Shadow(blurRadius: 70, offset: Offset(20, 16))],
        fontSize: fontSize ?? 100.sp,
        color: color ?? Colors.white,
        fontWeight: fontWeight ?? FontWeight.w600,
        height: 1.3,
        letterSpacing: 1.1);
  }
}
