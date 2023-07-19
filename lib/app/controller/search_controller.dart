import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/app/services/search_service.dart';
import 'package:weather_app/core/constants/app_constants.dart';

import '../models/city_model.dart';

class CitySearchController extends GetxController {
  SearchService searchService = Get.find();
  final RxString _currentCity = 'Bursa'.obs;
  final RxList<CityModel> _cityList = <CityModel>[].obs;

  String get currentCity => _currentCity.value;

  set currentCity(String value) => _currentCity.value = value;

  List<CityModel> get cityList => _cityList.value;

  set cityList(List<CityModel> value) => _cityList.value = value;

  @override
  void onInit() {
    getLocalData();
    super.onInit();
  }

   getLocalData(){
     final box = GetStorage();
    String? selectedCity= box.read(AppConstants.selectedCityKey);
    if(selectedCity!=null){
      currentCity=selectedCity;
    }
   }

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
