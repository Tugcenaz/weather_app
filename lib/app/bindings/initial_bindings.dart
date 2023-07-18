import 'package:get/get.dart';
import '../controller/api_client_controller.dart';
import '../controller/search_controller.dart';
import '../services/weather_service.dart';

class InitialBindings implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => ApiClientController(),fenix: true);
   Get.lazyPut(() => WeatherService(),fenix: true);
   Get.lazyPut(() => CitySearchController(),fenix: true);
  }

}