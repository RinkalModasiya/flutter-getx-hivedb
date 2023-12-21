import 'dart:convert';

import 'package:flutter_shop/app/data/models/product_model.dart';
import 'package:flutter_shop/config/network/network_constants.dart';


import '../../utility/utils.dart';
import 'base_services.dart';
import 'network_service.dart';

class ApiServices extends BaseServices {
  NetworkService? networkService;

  ApiServices() {
    printf("Network constructor");
    networkService = NetworkService();
  }

  @override
  Future<ProductModel?> getProducts() async {
    try {
      Uri uri = Uri.parse(NetworkAPIs.productAPI);
      var response = await networkService?.callRequest(
        uri: uri,
        requestType: "GET",
      );
      return response != null
          ? productModelFromJson(response.body)
          : null;
    } catch (err, log) {
      printf("Error: $err\n Log$log");
      return null;
    }
  }
}
