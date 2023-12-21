import 'package:flutter/material.dart';
import 'package:flutter_shop/config/app_theme.dart';
import 'package:flutter_shop/config/app_values.dart';
import 'package:get/get.dart';

import '../../config/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBackButtonPressed;
  final Widget? action;
  final Widget? leadingButton;
  final Widget? subtitle;
  final Widget? titleWidget;
  final String titleText;
  final bool showBoxShadow;

  const CustomAppBar({
    super.key,
    this.onBackButtonPressed,
    this.showBoxShadow = true,
    this.leadingButton,
    this.action,
    this.subtitle,
    this.titleWidget,
    this.titleText = "",
  });

  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.colorPrimary.withOpacity(0.7),
        ),
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: canPop || leadingButton != null,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: AppValues.padding_26,
                ),
                child: leadingButton != null
                    ? leadingButton!
                    : const SizedBox(
                        height: AppValues.size_30,
                        width: AppValues.size_30,
                      ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  titleText,
                  style: appTheme.textTheme.headlineSmall
                      ?.copyWith(color: AppColors.blackColor, fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: AppValues.padding_26,
              ),
              child: action ??
                  const SizedBox(
                    height: AppValues.size_30,
                    width: AppValues.size_30,
                  ),
            ),
          ],
        ).paddingOnly(
            top: MediaQuery.of(context).padding.top + AppValues.padding_10),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52.0);
}
