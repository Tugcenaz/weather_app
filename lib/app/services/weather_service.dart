import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/models/current_weather_model.dart';
import '../controller/api_client_controller.dart';

class WeatherService{
  final ApiClientController apiClientController = Get.find();
  
  Future<CurrentWeatherModel?> getCurrentWeather({required String cityName})async{
    var result= await apiClientController.clientGet(apiPath:'/current.json',extraParams: {'q':cityName});
    debugPrint("service result = $result");
    if(result!=null){
      CurrentWeatherModel currentWeatherModel= CurrentWeatherModel.fromJson(result);
      return currentWeatherModel;
    }
    else{
      return null;
    }
  }
}