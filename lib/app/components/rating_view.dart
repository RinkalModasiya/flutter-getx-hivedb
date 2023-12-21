import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_colors.dart';

class StarRating extends StatelessWidget {
  final void Function(int index) onChanged;
  final int value;
  final bool interactive;

  const StarRating(
      {super.key,
      required this.onChanged,
      this.value = 0,
      this.interactive = false});

  @override
  Widget build(BuildContext context) {
    const color = AppColors.colorSecondary;
    const size = 26.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return  InkWell(
          onTap: ()=>_handleStarClick(index),
          child: Icon(
            color: index < value ? color : null,
            size: size,
            index < value
                ? Icons.star
                : Icons.star_border,
          ).paddingOnly(right: 4),
        );
      }),
    );;
  }

  void _handleStarClick(int index) {
    if (interactive) {
      onChanged(value == index + 1 ? index : index + 1);
    }
  }
}
