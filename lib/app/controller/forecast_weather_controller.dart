import 'package:get/get.dart';
import 'package:weather_app/app/controller/city_search_controller.dart';
import 'package:weather_app/app/models/forecast_weather_model.dart';
import 'package:weather_app/app/services/forecast_weather_service.dart';

import '../../core/time_convert.dart';

class ForecastWeatherController extends GetxController {
  final RxInt selectedDayIndex = 0.obs;
  final Rx<ForecastWeatherModel> _forecastWeather = ForecastWeatherModel().obs;

  ForecastWeatherModel get forecastWeather => _forecastWeather.value;

  set forecastWeather(ForecastWeatherModel value) {
    _forecastWeather.value = value;
  }

  ForecastWeatherService forecastWeatherService = Get.find();
  CitySearchController citySearchController = Get.find();

  Future<ForecastWeatherModel?> getForecastWeather(
      {required String cityName}) async {
    ForecastWeatherModel? result =
        await forecastWeatherService.getForecastWeather(cityName: cityName);
    if (result != null) {
      if ((result.forecast) != null) {
        forecastWeather = result;
      }
    }
    return forecastWeather;
  }

  @override
  void onInit() {
    getForecastWeather(cityName: citySearchController.currentCity);
    super.onInit();
  }

  String getStringDate() {
    if (forecastWeather.forecast != null) {
      var result = dateToStringTimeWithoutYear((forecastWeather
                  .forecast!.forecastday?[selectedDayIndex.value].dateEpoch ??
              0) *
          1000);
      return result;
    }

    return '';
  }
}
