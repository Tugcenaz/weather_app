import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle generalWhiteTextStyle1(
      {Color? color, FontWeight? fontWeight, double? fontSize}) {
    return GoogleFonts.sourceSansPro(
        fontSize: fontSize ?? 24.sp,
        color: color ??  Colors.white,
        fontWeight: fontWeight ?? FontWeight.w600,
        height: 1.3,
        letterSpacing: 1.1);
  }


}
