import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/controller/api_client_controller.dart';
import 'package:weather_app/app/models/forecast_weather_model.dart';
import 'package:weather_app/core/static_data.dart';

class ForecastWeatherService {
  ApiClientController apiClientController = Get.find();

  Future<ForecastWeatherModel?> getForecastWeather(
      {required String cityName}) async {
    var result = await apiClientController.clientGet(
        apiPath: '/forecast.json',
        extraParams: {'q': cityName, 'days': WEATHER_FORECAST_DAY});
    debugPrint("forecastweather service result = $result");
    if (result != null) {
      ForecastWeatherModel forecastWeatherModel =
          ForecastWeatherModel.fromJson(result);
      return forecastWeatherModel;
    } else {
      return null;
    }
  }
}
