import 'package:dio/dio.dart';

import '../core/client/api_client.dart';
import '../model/product.dart';

abstract class IRemoteRepository {
  Future<List<Product>> getProducts();
}

class RemoteRepository implements IRemoteRepository {
  final ApiClient _apiClient;

  RemoteRepository(this._apiClient);

  @override
  Future<List<Product>> getProducts() async {
    final response = await _apiClient.getProducts();
    var products = response.data['products'] as List;
    return products.map<Product>((e) => Product.fromJson(e)).toList();
  }
}
