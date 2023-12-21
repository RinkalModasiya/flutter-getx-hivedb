import 'package:flutter/material.dart';
import 'package:flutter_shop/config/app_colors.dart';
import 'package:flutter_shop/config/app_theme.dart';
import 'package:flutter_shop/config/app_values.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback? onPressFunction;
  final String? buttonText;
  final Color? buttonFillColor;
  final Color? buttonBorderColor;
  final Color? buttonTextColor;

  const CommonButton({
    super.key,
    this.onPressFunction,
    this.buttonText,
    this.buttonFillColor,
    this.buttonBorderColor,
    this.buttonTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppValues.size_48,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  buttonFillColor ?? AppColors.whiteColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                          color:
                              buttonBorderColor ?? AppColors.colorPrimary)))),
          onPressed: () {
            onPressFunction != null ? onPressFunction!() : null;
          },
          child: Center(
              child: Text(
            buttonText ?? "N/A",
            style: appTheme.textTheme.displayMedium
                ?.copyWith(color: AppColors.colorPrimary),
          ))),
    );
  }
}
