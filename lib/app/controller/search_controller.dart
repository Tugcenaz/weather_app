import 'package:get/get.dart';

class CitySearchController extends GetxController {
  final RxString _currentCity = 'Bursa'.obs;

  String get currentCity => _currentCity.value;
  set currentCity(String value) => _currentCity.value = value;
}
