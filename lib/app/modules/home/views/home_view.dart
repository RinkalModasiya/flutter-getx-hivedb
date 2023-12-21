import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/app/data/models/product_model.dart';
import 'package:flutter_shop/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_shop/app/modules/home/widgets/product_list_item.dart';
import 'package:flutter_shop/config/app_strings.dart';
import 'package:flutter_shop/config/app_values.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../../../config/app_assets.dart';
import '../../../../config/local_db/hive_helper.dart';
import '../../../../utility/svg_extension.dart';
import '../../../../utility/utils.dart';
import '../../../components/custom_appbar.dart';
import '../../../routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: AppStrings.productList,
        leadingButton: CustomSvgPicture.customSvgAsset(
            image: SVGAssets.refreshIcon,
            onTap: () async {
              await controller.syncData(data: controller.productList);
            }),
      ),
      body: getProductList(context),
    );
  }

  //List Widget
  Widget getProductList(BuildContext context) {
    return controller.obx(
      (state) {
        return GetBuilder(
            init: HomeController(),
            initState: (i) {
              controller.myBox = Hive.box<Product>(HiveHelper.boxName);
            },
            builder: (context) {
              return ValueListenableBuilder<Box>(
                  valueListenable: controller.myBox!.listenable(),
                  builder: (context, box, widget) {
                    return Obx(
                      () => ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.productList.length,
                        itemBuilder: (
                          context,
                          index,
                        ) {
                          return ProductListItem(
                            productItemData: controller.productList[index],
                            onTap: () {
                              Get.toNamed(Routes.PRODUCT_DETAILS, arguments: [
                                {
                                  "data": json.encode(
                                      controller.productList[index].toJson())
                                },
                                {"index": index}
                              ])?.then((value) {
                                if (value != null) {
                                  Product data = value as Product;
                                  controller.productList[controller.productList
                                      .indexWhere((element) =>
                                          element.id == data.id)] = data;
                                  controller.update();
                                }
                              });
                            },
                          ).paddingSymmetric(vertical: 12, horizontal: 24);
                        },
                      ),
                    );
                  });
            });
      },
      onError: (msg) {
        printf("Error $msg");
        return const SizedBox();
      },
      onLoading: SizedBox(
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Lottie.asset(
            AppAssets.loaderJson,
            height: AppValues.size_94,
            width: AppValues.size_94,
          ),
        ),
      ),
    );
  }
}
