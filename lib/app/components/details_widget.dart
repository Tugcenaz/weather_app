import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/styles/text_styles.dart';

class detailsWidget extends StatelessWidget {
  final String icon;
  final String title;
  final double? weatherState;

  const detailsWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.weatherState});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon,
          width: 28.sp,
        ),
        SizedBox(
          width: 10.sp,
        ),
        Text(
          title,
          style: TextStyles.generalWhiteTextStyle3(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0.sp),
          child: Text(
            '|',
            style: TextStyles.generalWhiteTextStyle3(),
          ),
        ),
        if (weatherState != null)
          Text(
            '${weatherState?.toStringAsFixed(0)} km/h',
            style: TextStyles.generalWhiteTextStyle3(),
          ),
      ],
    );
  }
}
