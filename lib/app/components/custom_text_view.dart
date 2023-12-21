import 'package:flutter/material.dart';
import 'package:flutter_shop/config/app_colors.dart';
import 'package:flutter_shop/config/app_theme.dart';

class CustomTextView extends StatelessWidget {
  final Function(String val) onChange;
  final TextStyle? textStyle;
  final int? selectedIndex;
  final TextEditingController? textEditingController;
  final bool isTextFieldReadOnly;
  final EdgeInsetsGeometry? padding;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextInputType textInputType;

  const CustomTextView({
    super.key,
    required this.onChange,
    this.textStyle,
    this.selectedIndex,
    this.textEditingController,
    this.padding,
    this.textAlign,
    this.maxLines,
    this.textInputType = TextInputType.text,
    required this.isTextFieldReadOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.transparent),
      child: TextFormField(
        controller: textEditingController,
        readOnly: isTextFieldReadOnly,
        maxLines: maxLines,
        keyboardType: textInputType,
        textAlign: textAlign ?? TextAlign.start,
        cursorColor: AppColors.colorPrimary,
        style: textStyle ??
            appTheme.textTheme.bodyMedium!
                .copyWith(color: AppColors.blackColor),
        decoration: const InputDecoration(
          isDense: true,
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(0),
        ),
        onChanged: onChange,
      ),
    );
  }
}
