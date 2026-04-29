import 'package:dio/dio.dart';

class DioClient {
  static BaseOptions _baseOptions(String baseUrl) {
    return BaseOptions(
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      baseUrl: baseUrl,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    );
  }

  static Dio get dioMain => Dio(_baseOptions("http://192.168.1.243:2365/api/1/"));
}
