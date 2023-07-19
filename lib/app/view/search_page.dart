import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/core/constants/app_constants.dart';

import '../controller/search_controller.dart';
import '../controller/weather_controller.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  WeatherController weatherController = Get.find();
  final CitySearchController citySearchController = Get.find();

  String searchKey = "";

  search() async {
    await citySearchController.searchCity(searchingCityName: searchKey);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.sp),
          child: TextFormField(
            showCursor: true,
            onEditingComplete: () {
              search();
            },
            onChanged: (value) {
              searchKey = value;
            },
            decoration: InputDecoration(
              icon: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios_new_outlined),
              ),
              hintText: 'Şehir ara',
              prefixIcon: const Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: Obx(
            () => ListView.builder(
                itemCount: citySearchController.cityList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.0.sp),
                    child: ListTile(
                      onTap: () async {
                        citySearchController.currentCity =
                            citySearchController.cityList[index].name ?? "";
                        await weatherController.updateCurrentWeather(
                            cityName: citySearchController.currentCity);
                        final box=GetStorage();
                        box.write(AppConstants.selectedCityKey, citySearchController.currentCity);
                        citySearchController.cityList.clear();
                        Get.back();
                      },
                      title:
                          Text(citySearchController.cityList[index].name ?? ''),
                      subtitle: Text(
                          citySearchController.cityList[index].country ?? ''),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
