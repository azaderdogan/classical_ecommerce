import '../model/response.dart';

abstract class INetworkManager {
  Future<Response> get(String path);
  Future<Response> post(String path, dynamic data);
  Future<Response> put(String path, dynamic data);
  Future<Response> delete(String path);
}
