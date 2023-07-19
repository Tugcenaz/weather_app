import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/controller/weather_controller.dart';
import '../components/page_background_widget.dart';
import '../controller/search_controller.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  String searchKey = "";
  CitySearchController citySearchController = Get.find();
  WeatherController weatherController = Get.find();

  search() async {
    await citySearchController.searchCity(searchingCityName: searchKey);
  }

  Widget _buildBody() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 70.0.sp, horizontal: 30.sp),
          child: TextFormField(
            onEditingComplete: () {
              search();
            },
            onChanged: (value) {
              searchKey = value;
            },
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.sp),
                    borderSide: BorderSide.none)),
          ),
        ),
        Expanded(
          child: Obx(() => ListView.builder(
              itemCount: citySearchController.cityList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: (){
                    citySearchController.currentCity=citySearchController.cityList[index].name??"";
                    weatherController.updateCurrentWeather(cityName: citySearchController.currentCity);
                    citySearchController.cityList.clear();
                    Get.back();
                  },
                  title: Text(citySearchController.cityList[index].name ?? ''),
                );
              }),),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          pageBackGroundWidget(),
          _buildBody(),
        ],
      ),
    );
  }
}
