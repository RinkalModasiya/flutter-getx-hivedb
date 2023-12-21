import 'package:flutter/material.dart';
import 'package:flutter_shop/config/app_colors.dart';
import 'package:flutter_shop/config/app_strings.dart';
import 'package:flutter_shop/config/app_theme.dart';
import 'package:flutter_shop/config/app_values.dart';
import 'package:get/get.dart';

import '../../../../config/app_assets.dart';
import '../../../../utility/svg_extension.dart';
import '../../../components/common_button.dart';
import '../../../components/custom_appbar.dart';
import '../../../components/custom_text_view.dart';
import '../../../components/network_image_view.dart';
import '../../../components/rating_view.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  ProductDetailsView({super.key});

  final ProductDetailsController _controller =
      Get.find<ProductDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: controller.productData.title ?? "",
        leadingButton: CustomSvgPicture.customSvgAsset(
            image: SVGAssets.backIcon,
            height: AppValues.size_26,
            width: AppValues.size_26,
            onTap: () {
              Get.back();
            }),
        action: CustomSvgPicture.customSvgAsset(
            image: SVGAssets.editIcon,
            onTap: () {
              controller.interactive.value = true;
            }),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          _getImageData(context),
          _getDataBody(context),
          _getSaveButton(context)
        ],
      ),
    );
  }

  Widget _getImageData(BuildContext context) {
    return Container(
      child: NetworkImageView(
        imageUrl: controller.productData.thumbnail,
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 3,
      ).paddingAll(AppValues.padding_20),
    );
  }

  Widget _getDataBody(
    BuildContext context,
  ) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextView(
            textEditingController: controller.titleTextEditingController,
            onChange: (String val) {},
            maxLines: 1,
            isTextFieldReadOnly: !controller.interactive.value,
            textStyle: appTheme.textTheme.headlineMedium,
          ).paddingOnly(
              left: AppValues.padding_20,
              top: AppValues.padding_10,
              right: AppValues.padding_20,
              bottom: AppValues.size_4),
          CustomTextView(
            textEditingController: controller.brandTextEditingController,
            onChange: (String val) {},
            maxLines: 1,
            textStyle: appTheme.textTheme.labelMedium!
                .copyWith(color: AppColors.textColorContent),
            isTextFieldReadOnly: !controller.interactive.value,
          ).paddingOnly(
            left: AppValues.padding_20,
            right: AppValues.padding_20,
            bottom: AppValues.padding_20,
          ),
          _getStockAndPriceField().paddingOnly(bottom: AppValues.padding_10),
          dividerWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.productID,
                    style: appTheme.textTheme.headlineSmall?.copyWith(
                      color: AppColors.blackColor,
                      fontSize: 14,
                    ),
                  ).paddingOnly(
                    bottom: AppValues.padding_2,
                  ),
                  Text(
                    controller.productData.id.toString(),
                    style: appTheme.textTheme.labelMedium!.copyWith(
                        color: AppColors.textColorContent, fontSize: 14),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.productCategory,
                    style: appTheme.textTheme.headlineSmall?.copyWith(
                      color: AppColors.blackColor,
                      fontSize: 14,
                    ),
                  ).paddingOnly(
                    bottom: AppValues.padding_2,
                  ),
                  SizedBox(
                    width: 100,
                    child: CustomTextView(
                      textEditingController:
                          controller.categoryTextEditingController,
                      onChange: (String val) {},
                      maxLines: 1,
                      textStyle: appTheme.textTheme.labelMedium!.copyWith(
                          color: AppColors.textColorContent, fontSize: 14),
                      isTextFieldReadOnly: !controller.interactive.value,
                    ),
                  ),
                ],
              ),
            ],
          ).paddingOnly(
            left: AppValues.padding_20,
            right: AppValues.padding_20,
            bottom: AppValues.padding_4,
          ),
          dividerWidget(),
          Text(
            AppStrings.productDetails,
            style: appTheme.textTheme.headlineSmall?.copyWith(
              color: AppColors.blackColor,
              fontSize: 14,
            ),
          ).paddingOnly(
            left: AppValues.padding_20,
            bottom: AppValues.padding_4,
          ),
          CustomTextView(
            textEditingController: controller.descriptionTextEditingController,
            onChange: (String val) {},
            maxLines: null,
            textStyle: appTheme.textTheme.labelMedium!
                .copyWith(color: AppColors.blackColor, fontSize: 14),
            isTextFieldReadOnly: !controller.interactive.value,
          ).paddingOnly(
            left: AppValues.padding_20,
            bottom: AppValues.padding_10,
            right: AppValues.padding_20,
          ),
          dividerWidget(),
          _getProductReviews()
        ],
      ),
    );
  }

  Widget _getStockAndPriceField() {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                CustomSvgPicture.customSvgAsset(
                    image: SVGAssets.stockIcon,
                    height: AppValues.size_26,
                    width: AppValues.size_26,
                    onTap: () {}),
                SizedBox(
                  width: 40,
                  child: CustomTextView(
                    textEditingController:
                        controller.stockTextEditingController,
                    onChange: (String val) {},
                    maxLines: 1,
                    textInputType: TextInputType.number,
                    textAlign: TextAlign.center,
                    textStyle: appTheme.textTheme.headlineSmall,
                    isTextFieldReadOnly: !controller.interactive.value,
                  ),
                ),
              ],
            ).paddingOnly(left: AppValues.padding_20),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  AppStrings.dollarSign,
                  style: appTheme.textTheme.headlineSmall?.copyWith(
                    color: AppColors.blackColor,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  width: AppValues.size_68,
                  child: CustomTextView(
                    textEditingController:
                        controller.priceTextEditingController,
                    onChange: (String val) {},
                    maxLines: 1,
                    textInputType: TextInputType.number,
                    textStyle: appTheme.textTheme.headlineSmall,
                    isTextFieldReadOnly: !controller.interactive.value,
                  ),
                ),
              ],
            ).paddingOnly(right: AppValues.padding_20),
          ),
        ],
      ),
    );
  }

  Widget _getProductReviews() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        AppStrings.productReviews,
        style: appTheme.textTheme.headlineSmall?.copyWith(
          color: AppColors.blackColor,
          fontSize: 14,
        ),
      ),
      Obx(
        () => StarRating(
          value: controller.rating.value,
          interactive: controller.interactive.value,
          onChanged: controller.updateRating,
        ),
      ),
    ]).paddingOnly(
      left: AppValues.padding_20,
      right: AppValues.padding_20,
      bottom: AppValues.padding_4,
    );
  }

  Widget _getSaveButton(BuildContext context) {
    return CommonButton(
      onPressFunction: () {
        controller.saveData;
      },
      buttonText: AppStrings.save,
    ).paddingSymmetric(horizontal: AppValues.padding_26).paddingOnly(
        bottom: MediaQuery.of(context).padding.bottom,
        top: AppValues.padding_10);
  }

  Widget dividerWidget() {
    return Divider(
      color: AppColors.lightGreyColor,
      thickness: 1.0,
    );
  }
}
