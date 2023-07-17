import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/constants/image_constants.dart';

Widget pageBackGroundWidget() {
  return SvgPicture.asset(
    ImageConstants.homeBackground,
    width: double.infinity,
    height: double.infinity,
    fit: BoxFit.cover,
  );
}

