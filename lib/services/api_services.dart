import 'dart:core';
import 'package:dio/dio.dart';

class ApiService {
  final _dio = Dio();

  postDynamic({
    required String path,
    dynamic body,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: body,
      );

      return response;
    } catch (e) {
      print(e);
    }
  }

  getDynamic({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          followRedirects: false,
          // will not throw errors
          validateStatus: (status) => true,
        ),
      );
      return response;
    } catch (e) {
      print(e);
    }
  }
}
