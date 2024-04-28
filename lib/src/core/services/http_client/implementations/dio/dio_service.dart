import 'package:dio/dio.dart';

class DioFactory {
  static Dio getCustomDioInstance() {
    final dio = Dio();
    // TODO: dio.interceptors.add(CustomDioTokenInterceptors());
    return dio;
  }
}
