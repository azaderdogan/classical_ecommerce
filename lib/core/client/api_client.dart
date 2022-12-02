import 'package:ecommerce_task/core/network/i_network_manager.dart';

import '../model/response.dart';

class ApiClient {
  final INetworkManager _networkManager;

  ApiClient(this._networkManager);

  Future<Response> getProducts() async {
    return await _networkManager.get('/products');
  }
}
