// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io' as io;

import 'package:dio/dio.dart';

import '../../../../../imports.dart';

class DioHttpClient implements IHttpClient {
  final Dio _dio;
  DioHttpClient(
    this._dio,
  );

  @override
  Future<T> get<T>(String path,
      {Map<String, dynamic>? params, Map<String, dynamic>? headers}) async {
    try {
      var response = await _dio.get(
        path,
        queryParameters: params,
        options: headers != null ? Options(headers: headers) : null,
      );
      return response.data;
    } on io.SocketException {
      // TODO: Handle this error
      rethrow;
    } on DioException catch (e) {
      // TODO: Handle this error
      rethrow;
    }
  }

  @override
  Future<T> post<T>(String path, {data, params}) async {
    try {
      var response = await _dio.post(
        path,
        data: data,
        queryParameters: params,
      );
      return response.data;
    } on io.SocketException {
      rethrow;
    } on DioException catch (e) {
      rethrow;
    }
  }

  @override
  Future<T> put<T>(String path, data) async {
    try {
      var response = await _dio.put(path, data: data);
      return response.data;
    } on io.SocketException {
      rethrow;
    } on DioException catch (e) {
      rethrow;
    }
  }

  @override
  Future<T> delete<T>(String path, data) async {
    try {
      var response = await _dio.delete(path, data: data);
      return response.data;
    } on io.SocketException {
      rethrow;
    } on DioException catch (e) {
      rethrow;
    }
  }
}
