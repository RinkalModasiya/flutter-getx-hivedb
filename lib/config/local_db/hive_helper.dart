import 'package:flutter_shop/app/data/models/product_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../../utility/utils.dart';

class HiveHelper extends GetxController {
  static const String boxName = 'myBox';
  Box<Product>? myBox;

  // Singleton instance
  static final HiveHelper _instance = HiveHelper._internal();

  factory HiveHelper() {
    return _instance;
  }

  HiveHelper._internal();

  @override
  void onInit() async {
    //Initialize Hive
    await _initHive();
    super.onInit();
  }

  Future<void> _initHive() async {
    final document = await getApplicationDocumentsDirectory();
    Hive.init(document.path);
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(ProductAdapter());
    }
    myBox = await Hive.openBox<Product>(boxName);
  }

  Future<void> saveDataFromApi(List<Product> data) async {
    await myBox!.clear();
    await myBox!.addAll(data);
    update();
  }

  List<Product> getData() {
    return myBox!.values.toList();
  }

  List<Product> getLatestSyncedData(List<Product> data) {
    for (int i = 0; i < myBox!.values.length; i++) {
      myBox!.putAt(i, data[i]);
    }
    return myBox!.values.toList();
  }

  Future<void> updateProduct(Product data, int index) async {
    myBox!.putAt(index, data);
    printf('Info updated to box!');
  }

  @override
  void dispose() {
    // close all the open boxes before closing the page.
    Hive.close();
    super.dispose();
  }
}
