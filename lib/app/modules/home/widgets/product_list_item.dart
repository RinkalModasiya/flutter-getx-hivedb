import 'package:flutter/material.dart';
import 'package:flutter_shop/app/data/models/product_model.dart';
import 'package:flutter_shop/config/app_strings.dart';
import 'package:get/get.dart';

import '../../../../config/app_colors.dart';
import '../../../../config/app_theme.dart';
import '../../../../config/app_values.dart';
import '../../../../utility/utils.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    super.key,
    required this.productItemData,
    required this.onTap,
  });

  final Product productItemData;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppColors.colorPrimary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.colorSecondary,
                  child: Center(
                    child: Text(
                      productItemData.id.toString(),
                      style: appTheme.textTheme.titleSmall
                          ?.copyWith(color: AppColors.blackColor),
                    ),
                  ),
                ).paddingOnly(
                  top: AppValues.padding_8,
                  right: AppValues.padding_8,
                ),
                Expanded(
                  child: Text(
                    productItemData.title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: appTheme.textTheme.titleSmall
                        ?.copyWith(color: AppColors.whiteColor),
                  ),
                ),
              ],
            ).paddingOnly(
              left: AppValues.size_10,
              bottom: AppValues.size_4,
            ),
            Text(
              productItemData.description ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: appTheme.textTheme.bodySmall
                  ?.copyWith(color: AppColors.whiteColor),
            ).paddingAll(AppValues.size_10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppStrings.updatedAt,
                  style: appTheme.textTheme.labelSmall?.copyWith(
                      color: AppColors.whiteColor, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Text(
                    Utils.getFormattedDate(productItemData.lastUpdatedAt),
                    style: appTheme.textTheme.labelSmall
                        ?.copyWith(color: AppColors.whiteColor),
                  ),
                ),
              ],
            ).paddingOnly(
              bottom: AppValues.size_10,
              left: AppValues.size_10,
              right: AppValues.size_10,
            )
          ],
        ),
      ),
    );
  }
}
