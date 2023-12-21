import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/app/data/models/product_model.dart';
import 'package:flutter_shop/config/local_db/hive_helper.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  dynamic argumentData = Get.arguments;
  Product productData = Product();
  var productIndex = 0;
  var rating = 0.obs;
  var stockNumber = 1.obs;
  var interactive = false.obs;
  late final TextEditingController titleTextEditingController;
  late final TextEditingController descriptionTextEditingController;
  late final TextEditingController priceTextEditingController;
  late final TextEditingController stockTextEditingController;
  late final TextEditingController brandTextEditingController;
  late final TextEditingController categoryTextEditingController;

  @override
  void onInit() {
    super.onInit();
    _getData(argumentData[0]['data']);
    productIndex = argumentData[1]['index'];
  }

  void _getData(String? data) {
    productData = Product.fromJson(json.decode(data!));
    titleTextEditingController = TextEditingController(text: productData.title);
    descriptionTextEditingController =
        TextEditingController(text: productData.description);
    priceTextEditingController =
        TextEditingController(text: productData.price.toString());
    stockTextEditingController =
        TextEditingController(text: productData.stock.toString());
    stockNumber.value = productData.stock ?? 0;
    brandTextEditingController = TextEditingController(text: productData.brand);
    categoryTextEditingController =
        TextEditingController(text: productData.category);
    rating.value = productData.rating!.round();
  }

  void updateRating(int newRating) {
    rating.value = newRating;
  }

  void get saveData => _saveData();

  _saveData() async {
    var newData = Product(
        id: productData.id,
        title: titleTextEditingController.text.trim(),
        description: descriptionTextEditingController.text.trim(),
        price: int.parse(priceTextEditingController.text.trim()),
        stock: int.parse(stockTextEditingController.text.trim()),
        rating: double.parse(rating.value.toString()),
        brand: brandTextEditingController.text.trim(),
        thumbnail: productData.thumbnail,
        images: productData.images,
        category: categoryTextEditingController.text.trim(),
        lastUpdatedAt: DateTime.now());
    await HiveHelper().updateProduct(newData, productIndex);
    Get.back(result: newData);
  }
}
