import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/core/constants/icon_constants.dart';
import 'package:weather_app/core/styles/text_styles.dart';
import '../../components/page_background_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  Widget _buildBody() {
    return Column(
      children: [
        locationWidget(),
        Text('ikonlar olacak'),

      ],
    );
  }

  Widget locationWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 70.0.sp, horizontal: 30.sp),
      child: Bounceable(
        onTap: () {
          // Get.to(() => SearchPage());
        },
        child: Row(
          children: [
            SizedBox(
              width: 24.sp,
              height: 24.sp,
              child: SvgPicture.asset(
                IconConstants.map_icon,
              ),
            ),
            SizedBox(
              width: 20.sp,
            ),
            Text(
              'Surabaya',
              style: TextStyles.generalWhiteTextStyle1(),
            ),
            SizedBox(
              width: 20.sp,
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.0.sp),
              child: SvgPicture.asset(
                IconConstants.opt_icon,
                width: 26.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pageBackGroundWidget(),
          _buildBody(),
        ],
      ),
    );
  }
}
