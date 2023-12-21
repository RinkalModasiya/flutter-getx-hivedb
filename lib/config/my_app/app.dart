import 'package:flutter/material.dart';
import 'package:flutter_shop/app/modules/splash/bindings/splash_binding.dart';
import 'package:flutter_shop/config/local_db/hive_helper.dart';
import 'package:get/get.dart';

import '../../app/routes/app_pages.dart';
import '../app_strings.dart';
import '../app_theme.dart';
import 'app_controller.dart';

class MyApp extends GetView<AppController> {
  MyApp({Key? key}) : super(key: key);

  final AppController _controller = Get.put(AppController(), permanent: true);
  final HiveHelper _helper = Get.put(HiveHelper());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      builder: (context, widget) {
        return Theme(
          data: appTheme,
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          ),
        );
      },
      initialRoute: AppPages.INITIAL,
      initialBinding: SplashBinding(),
      // first screen to show when app is running
      getPages: AppPages.routes, // app screens
    );
  }
}
