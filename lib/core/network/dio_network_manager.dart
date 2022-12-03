import 'package:dio/dio.dart';
import 'package:ecommerce_task/core/model/response.dart' as core;
import 'package:ecommerce_task/core/network/i_network_manager.dart';

class DioNetworkManager implements INetworkManager {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com',
    ),
  );

  DioNetworkManager();

  @override
  Future<core.Response> get(String path) async {
    final response = await _dio.get(path);
    return core.Response.fromDioResponse(response);
  }

  Future<core.Response> post(String path, dynamic data) async {
    final response = await _dio.post(path, data: data);
    return core.Response.fromDioResponse(response);
  }

  @override
  Future<core.Response> delete(String path) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<core.Response> put(String path, data) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
