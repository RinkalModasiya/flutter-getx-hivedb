import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/config/local_db/hive_helper.dart';

import 'config/my_app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HiveHelper().onInit();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.white,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(MyApp());
}
