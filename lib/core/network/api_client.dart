import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com/docs',
    ),
  );

  ApiClient();

  Future<Response> get(String path) async {
    final response = await _dio.get(path);
    return response;
  }

  Future<Response> post(String path, dynamic data) async {
    final response = await _dio.post(path, data: data);
    return response;
  }
}
