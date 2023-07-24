import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simple_animations/animation_builder/mirror_animation_builder.dart';
import 'package:weather_app/app/components/my_custom_button.dart';
import 'package:weather_app/app/controller/forecast_weather_controller.dart';
import 'package:weather_app/app/view/forecast_report_page/forecast_report_page.dart';
import 'package:weather_app/app/view/search_page.dart';
import 'package:weather_app/app/components/weather_icon_widget.dart';
import 'package:weather_app/app/components/details_widget.dart';
import 'package:weather_app/app/controller/city_search_controller.dart';
import 'package:weather_app/app/controller/weather_controller.dart';
import 'package:weather_app/core/constants/icon_constants.dart';
import 'package:weather_app/core/styles/text_styles.dart';
import 'package:weather_app/core/time_convert.dart';
import '../../components/page_background_widget.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  WeatherController weatherController = Get.find();
  CitySearchController citySearchController = Get.find();
  ForecastWeatherController forecastWeatherController = Get.find();

  currentWeather() async {
    await weatherController.updateCurrentWeather(
        cityName: citySearchController.currentCity);
    return true;
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.sp, vertical: 50.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          locationWidget(),
          Obx(
            () => MirrorAnimationBuilder(
              builder: (BuildContext context, value, Widget? child) {
                return Transform.scale(scale: value.toDouble(), child: child);
              },
              tween: Tween(begin: 1.2, end: 0.8),
              duration: const Duration(milliseconds: 1500),
              child: weatherIconWidget(
                  height: 200,
                  width: 200,
                  imageUrl:
                      'https:${weatherController.currentWeatherModel.current?.condition?.icon}'),
            ),
          ),
          Obx(
            () => Text(
              'Hissedilen sıcaklık :  ${weatherController.currentWeatherModel.current?.feelslikeC}°',
              style: TextStyles.generalWhiteTextStyle3(),
            ),
          ),
          currentWeatherWidget(),
          MyCustomButton(
              title: 'Haftalık Tahmin',
              onTap: () async {
                var data = await forecastWeatherController.getForecastWeather(
                    cityName: citySearchController.currentCity);
                if (data != null) {
                  Get.to(
                    () => ForecastReportPage(),
                  );
                } else {
                  Get.snackbar('Hata', 'Sistem Hatası');
                }
              }),
        ],
      ),
    );
  }

  Widget currentWeatherWidget() {
    return Obx(
      () => Container(
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
          padding:  EdgeInsets.symmetric(vertical: 24.0.sp),
          child: Column(
            children: [
              Text(
                dateToStringTime((weatherController
                            .currentWeatherModel.current?.lastUpdatedEpoch ??
                        0) *
                    1000),
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
                height: 20.sp,
              ),
              detailsWidget(
                  icon: IconConstants.windy_icon,
                  title: 'Rüzgar',
                  weatherState:
                      weatherController.currentWeatherModel.current?.windKph),
              SizedBox(
                height: 20.sp,
              ),
              detailsWidget(
                  icon: IconConstants.hum_icon,
                  title: 'Nem',
                  weatherState: weatherController
                      .currentWeatherModel.current?.humidity
                      ?.toDouble()),
            ],
          ),
        ),
      ),
    );
  }

  Widget locationWidget() {
    return Bounceable(
      onTap: () {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0.sp),
            ),
            isScrollControlled: true,
            useSafeArea: true,
            context: Get.context!,
            builder: (BuildContext context) {
              return SearchPage();
            });
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
          Obx(
            () => Text(
              citySearchController.currentCity,
              style: TextStyles.generalWhiteTextStyle1(),
            ),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          pageBackGroundWidget(),
          FutureBuilder(
              future: currentWeather(),
              builder: (_, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return _buildBody();
                } else {
                  return const CircularProgressIndicator();
                }
              })
        ],
      ),
    );
  }
}
