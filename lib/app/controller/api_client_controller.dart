import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class ApiClientController {
  final dio = Dio(BaseOptions(baseUrl: dotenv.env['API_BASE_URL']!));

  Future clientGet(
      {required String apiPath, Map<String, dynamic>? extraParams}) async {
    //her istekte query içinde istenen parametreler
    Map<String, dynamic> queryParams = {
      'key': dotenv.env['API_KEY'],
      'lang':'tr'
    };
    //extra parametre istendiyse eklendi
    if (extraParams != null) {
      queryParams.addAll(extraParams);
    }
    try {
      var result = await dio.get(apiPath, queryParameters: queryParams);
      return result.data;
    } catch (e) {
      Get.log("CLIENT GET ERROR: $e");
    }
  }
}
