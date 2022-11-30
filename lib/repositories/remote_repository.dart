import 'package:dio/dio.dart';
import 'package:ecommerce_task/core/network/api_client.dart';

import '../model/product.dart';

abstract class IRemoteRepository {
  Future<List<Product>> getProducts();
}

class RemoteRepository implements IRemoteRepository {
  final ApiClient _apiClient;

  RemoteRepository(this._apiClient);

  @override
  Future<List<Product>> getProducts() async {
    final response = await _apiClient.get('/products');
    return response.data.map<Product>((e) => Product.fromJson(e)).toList();
  }
}