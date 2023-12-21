import 'package:flutter_shop/app/data/models/product_model.dart';

abstract class BaseServices {
  Future<ProductModel?> getProducts();
}
