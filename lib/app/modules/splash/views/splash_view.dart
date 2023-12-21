import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/app_colors.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  SplashView({super.key});

  final SplashController _controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.size.width,
      height: Get.size.height,
      decoration: const BoxDecoration(
        color: AppColors.colorPrimary,
      ),
    );
  }
}
