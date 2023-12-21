import 'package:flutter_shop/app/data/models/product_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../../config/local_db/hive_helper.dart';
import '../../../../config/network/service.dart';

class HomeController extends GetxController with StateMixin {
  final Services _services = Services();
  final productList = RxList<Product>.empty(growable: true);
  late Box<Product>? myBox;

  @override
  void onInit() async {
    super.onInit();
    _fetchData();
  }

  void _fetchData() async {
    change(productList, status: RxStatus.loading());
    List<Product> list = HiveHelper().getData();
    if (list.isEmpty) {
      await _apiCall();
    } else {
      getData();
    }
    change(productList, status: RxStatus.success());
  }

  Future<void> _apiCall() async {
    final response = await _services.api!.getProducts();
    if (response != null) {
      productList.addAll(response.products);
    }
    await _addDateToModel();
    if (productList.isNotEmpty) {
      await HiveHelper().saveDataFromApi(productList);
    }
  }

  Future<void> _addDateToModel() async {
    for (var product in productList) {
      product.lastUpdatedAt = DateTime.now();
    }
  }

  void getData() {
    List<Product> list = HiveHelper().getData();
    productList.clear();
    productList.addAll(list);
    update();
  }

  Future<void> syncData({List<Product>? data}) async {
    await _addDateToModel();
    List<Product> list = HiveHelper().getLatestSyncedData(data!);
    productList.clear();
    productList.addAll(list);
    update();
  }
}
