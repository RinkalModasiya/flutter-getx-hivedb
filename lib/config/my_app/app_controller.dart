import 'package:get/get.dart';

import '../network/service.dart';


class AppController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    Services().setAppConfig();
  }
}
