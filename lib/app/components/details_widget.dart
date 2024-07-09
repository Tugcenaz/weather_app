import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/styles/text_styles.dart';

class DetailsWidget extends StatelessWidget {
  final String icon;
  final String title;
  final double? weatherState;

  const DetailsWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.weatherState});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          SvgPicture.asset(
            icon,
            width: 28.sp,
          ),
          Text(
            title,
            style: TextStyles.generalWhiteTextStyle3(),
          ),
          if (weatherState != null)
            Text(
              '${weatherState?.toStringAsFixed(0)} km/h',
              style: TextStyles.generalWhiteTextStyle3(),
            ),
        ])
      ],
    );
  }
}
