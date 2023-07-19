import 'package:get/get.dart';
import 'package:weather_app/app/services/search_service.dart';

import '../models/city_model.dart';

class CitySearchController extends GetxController {
  SearchService searchService = Get.find();
  final RxString _currentCity = 'Bursa'.obs;
  final RxList<CityModel> _cityList = <CityModel>[].obs;

  String get currentCity => _currentCity.value;

  set currentCity(String value) => _currentCity.value = value;

  List<CityModel> get cityList => _cityList.value;

  set cityList(List<CityModel> value) => _cityList.value = value;

  Future<List<CityModel>> searchCity(
      {required String searchingCityName}) async {
    List<CityModel>? cityModelList =
        await searchService.searchCity(searchingCityName: searchingCityName);
    if (cityModelList != null) {
      cityList = cityModelList;
    }
    return cityList;
  }
}
