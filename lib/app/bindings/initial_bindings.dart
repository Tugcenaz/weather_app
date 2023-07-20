import 'package:get/get.dart';
import 'package:weather_app/app/controller/forecast_weather_controller.dart';
import 'package:weather_app/app/controller/weather_controller.dart';
import 'package:weather_app/app/services/forecast_weather_service.dart';
import 'package:weather_app/app/services/search_service.dart';
import '../controller/api_client_controller.dart';
import '../controller/city_search_controller.dart';
import '../services/weather_service.dart';

class InitialBindings implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => ApiClientController(),fenix: true);
   Get.lazyPut(() => WeatherService(),fenix: true);
   Get.lazyPut(() => CitySearchController(),fenix: true);
   Get.lazyPut(() => WeatherController(),fenix: true);
   Get.lazyPut(() => SearchService(),fenix: true);
   Get.lazyPut(() => ForecastWeatherService(),fenix: true);
   Get.lazyPut(() => ForecastWeatherController(),fenix: true);
  }

}