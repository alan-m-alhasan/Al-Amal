// ignore_for_file: file_names

import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://alwadi-center.com/myapp/ludo/public/api/",
        receiveDataWhenStatusError: true,
        headers: {'Content-Type': 'application/json'},
      ),
    );
  }

  static Future<Response?> getData({
    required String url,
    required Map<String, dynamic> query,
    // String lang = "en",
    // String? token,
  }) async {
    dio?.options.headers = {
      // 'lang': lang,
      // 'Authorization': token,
    };
    return await dio?.get(url, queryParameters: query);
  }

  static Future<Response?> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    // String lang = "en",
    String? token,
  }) async {
    dio?.options.headers = {
      //  'lang': lang,
      'Authorization': token,
    };
    return await dio?.post(url, queryParameters: query, data: data);
  }
}
