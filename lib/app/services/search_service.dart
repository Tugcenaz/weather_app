import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/controller/api_client_controller.dart';
import 'package:weather_app/app/models/city_model.dart';

class SearchService {
  ApiClientController apiClientController = Get.find();

  Future<List<CityModel>?> searchCity({required String searchingCityName}) async {
    var result = await apiClientController
        .clientGet(apiPath: '/search.json', extraParams: {'q': searchingCityName});
    debugPrint("search service result = $result");
    List<CityModel> cityList = [];
    if (result != null) {
      for(var item in result){
        CityModel cityModel = CityModel.fromJson(item);
        cityList.add(cityModel);
      }
      return cityList;
    } else {
      return null;
    }
  }
}
