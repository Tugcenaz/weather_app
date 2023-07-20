import 'package:get/get.dart';
import 'package:weather_app/app/models/forecast_weather_model.dart';
import 'package:weather_app/app/services/forecast_weather_service.dart';

import '../../core/time_convert.dart';

class ForecastWeatherController {
  final RxInt selectedDayIndex = 0.obs;
  final Rx<ForecastWeatherModel> _forecastWeather = ForecastWeatherModel().obs;

  ForecastWeatherModel get forecastWeather => _forecastWeather.value;

  set forecastWeather(ForecastWeatherModel value) {
    _forecastWeather.value = value;
  }

  ForecastWeatherService forecastWeatherService = Get.find();

  Future<ForecastWeatherModel?> getForecastWeather(
      {required String cityName}) async {
    ForecastWeatherModel? result =
        await forecastWeatherService.getForecastWeather(cityName: cityName);
    if (result != null) {
        forecastWeather = result;
    }
    return forecastWeather;
  }

  String getStringDate()  {
    if(forecastWeather.forecast!=null){
      var result =  dateToStringTimeWithoutYear((forecastWeather
          .forecast!
          .forecastday?[selectedDayIndex.value]
              .dateEpoch ??
          0) *
          1000);
      return result;
    }

    return '';
  }
}
