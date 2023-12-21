import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension CustomSvgPicture on SvgPicture {
  static Widget customSvgAsset({
    required String image,
    double? width,
    double? height,
    Color? color,
    BoxFit? boxFit,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(
        image,
        width: width,
        height: height,
        fit: boxFit ?? BoxFit.fill,
      ),
    );
  }
}
