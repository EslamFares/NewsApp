import 'package:dio/dio.dart';

// https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=2b7b5278db66427f998cccaa061b4bb9

class DioHelper {
  static Dio dio = Dio();
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://newsapi.org",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio.get(url,
        queryParameters: query,
        options: Options(
            contentType: 'application/json',
            followRedirects: false,
            validateStatus: (state) {
              return state! < 500;
            }));
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    // var formData = FormData.fromMap(query);
    return await dio.post(url,
        data: query,
        options: Options(
            contentType: 'application/json',
            followRedirects: false,
            validateStatus: (state) {
              return state! < 500;
            }));
  }
}
