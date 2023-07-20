import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/components/weather_icon_widget.dart';
import 'package:weather_app/app/controller/city_search_controller.dart';
import 'package:weather_app/app/controller/forecast_weather_controller.dart';
import 'package:weather_app/app/controller/weather_controller.dart';
import 'package:weather_app/core/styles/text_styles.dart';
import 'package:weather_app/core/time_convert.dart';
import '../../components/page_background_widget.dart';
import '../../models/forecast_weather_model.dart';

class ForecastReportPage extends StatelessWidget {
  ForecastReportPage({Key? key}) : super(key: key);
  CitySearchController citySearchController = Get.find();
  WeatherController weatherController = Get.find();
  ForecastWeatherController forecastWeatherController = Get.find();

  getForecastWeather() async {
    await forecastWeatherController.getForecastWeather(
        cityName: citySearchController.currentCity);
  }

  Widget rowAppBarWidget() {
    return Bounceable(
      onTap: () {
        Get.back();
      },
      child: Row(
        children: [
          const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          SizedBox(
            width: 10.sp,
          ),
          Text(
            'Geri',
            style: TextStyles.generalWhiteTextStyle1(),
          ),
        ],
      ),
    );
  }

  Widget rowDateTimeAndCity() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => Text(
            forecastWeatherController.getStringDate(),
            style:
                TextStyles.generalWhiteTextStyle3(fontWeight: FontWeight.w600),
          ),
        ),
        Text(
          citySearchController.currentCity,
          style: TextStyles.generalWhiteTextStyle1(
              fontSize: 28.sp, fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  Widget todayWeatherListviewBuilder() {
    return Obx(() => ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: forecastWeatherController
                .forecastWeather
                .forecast
                ?.forecastday?[forecastWeatherController.selectedDayIndex.value]
                .hour
                ?.length ??
            0,
        itemBuilder: (_, int index) {
          HourWeather? hourWeather = forecastWeatherController
              .forecastWeather
              .forecast
              ?.forecastday?[forecastWeatherController.selectedDayIndex.value]
              .hour?[index];
          if (hourWeather != null) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.sp),
              child: Column(
                children: [
                  Text(
                    '${(hourWeather.tempC ?? 0).toStringAsFixed(1)}°C',
                    style: TextStyles.generalWhiteTextStyle3(
                        fontWeight: FontWeight.w700, fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  weatherIconWidget(
                      imageUrl: 'https:${hourWeather.condition?.icon}',
                      width: 70,
                      height: 70),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    timeToString(hourWeather.time!),
                    style: TextStyles.generalWhiteTextStyle3(
                        fontWeight: FontWeight.w600, fontSize: 18.sp),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        }));
  }

  Widget forecastOfTheNextDays() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() => ListView.builder(
          itemCount: forecastWeatherController
              .forecastWeather.forecast?.forecastday?.length,
          itemBuilder: (_, int index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dateToStringTime((forecastWeatherController.forecastWeather
                              .forecast!.forecastday?[index].dateEpoch ??
                          0) *
                      1000),
                  style: TextStyles.generalWhiteTextStyle3(fontSize: 18.sp),
                ),
                weatherIconWidget(
                    imageUrl:
                        'https:${forecastWeatherController.forecastWeather.forecast!.forecastday?[index].day?.condition?.icon ?? ''}',
                    width: 60,
                    height: 60),
                Text(
                  '${forecastWeatherController.forecastWeather.forecast!.forecastday?[index].day?.avgtempC ?? 0}°',
                  style: TextStyles.generalWhiteTextStyle3(fontSize: 18.sp),
                ),
              ],
            );
          })),
    );
  }

  Widget _buildBody() {
    getForecastWeather();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 70.0.sp, horizontal: 20.sp),
      child: Column(
        children: [
          rowAppBarWidget(),
          SizedBox(
            height: 20.sp,
          ),
          rowDateTimeAndCity(),
          SizedBox(
            height: 20.sp,
          ),
          Expanded(child: todayWeatherListviewBuilder()),
          Text(
            'Tahminler',
            style: TextStyles.generalWhiteTextStyle1(),
          ),
          Expanded(
            flex: 2,
            child: forecastOfTheNextDays(),
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
          _buildBody(),
        ],
      ),
    );
  }
}
