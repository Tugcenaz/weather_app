import 'package:get/get.dart';
import 'package:weather_app/app/controller/forecast_weather_controller.dart';

import '../../core/time_convert.dart';
import '../models/current_weather_model.dart';
import '../services/weather_service.dart';

class WeatherController extends GetxController {
  WeatherService weatherService = Get.find();
  ForecastWeatherController forecastWeatherController = Get.find();
  final Rx<CurrentWeatherModel> _currentWeatherModel =
      CurrentWeatherModel().obs;

  CurrentWeatherModel get currentWeatherModel => _currentWeatherModel.value;

  set currentWeatherModel(CurrentWeatherModel value) {
    _currentWeatherModel.value = value;
  }

  Future<CurrentWeatherModel?> updateCurrentWeather(
      {required String cityName}) async {
    CurrentWeatherModel? result =
        await weatherService.getCurrentWeather(cityName: cityName);
    if (result != null) {
      currentWeatherModel = result;
    }
    return currentWeatherModel;
  }


}
