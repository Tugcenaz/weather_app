import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/components/weather_icon_widget.dart';
import 'package:weather_app/app/components/wind_and_hum_widget.dart';
import 'package:weather_app/app/controller/weather_controller.dart';
import 'package:weather_app/core/constants/icon_constants.dart';
import 'package:weather_app/core/styles/text_styles.dart';
import '../../components/page_background_widget.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  WeatherController weatherController = Get.find();

  currentWeather() async {
    await weatherController.getCurrentWeather(cityName: 'Bursa');
  }

  Widget _buildBody() {
    currentWeather();
    return Column(
      children: [
        locationWidget(),
        Obx(
          () => weatherIconWidget(
              imageUrl:
                  'https:${weatherController.currentWeatherModel.current?.condition?.icon}'),
        ),
        SizedBox(
          height: 100.h,
        ),
        currentWeatherWidget(),
      ],
    );
  }

  Container currentWeatherWidget() {
    return Container(
      height: 335.sp,
      width: 353.sp,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.7), width: 2.sp),
        borderRadius: BorderRadius.circular(16.sp),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.5),
            Colors.white.withOpacity(0.4)
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'tarih gelecek',
              style: TextStyles.generalWhiteTextStyle1(fontSize: 18.sp),
            ),
            Text(
              '${weatherController.currentWeatherModel.current?.tempC?.toStringAsFixed(0)}°',
              style: TextStyles.generalWhiteTextStyle2(),
              textAlign: TextAlign.center,
            ),
            Text(
              '${weatherController.currentWeatherModel.current?.condition?.text}',
              style: TextStyles.generalWhiteTextStyle1(),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.sp,
            ),
            WindAndHumWidget(
                icon: IconConstants.windy_icon,
                title: 'Rüzgar',
                weatherState:
                    weatherController.currentWeatherModel.current?.windKph),
            SizedBox(height: 10.sp,),
            WindAndHumWidget(
                icon: IconConstants.hum_icon,
                title: 'Nem',
                weatherState:
                    weatherController.currentWeatherModel.current?.humidity?.toDouble()),
          ],
        ),
      ),
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
