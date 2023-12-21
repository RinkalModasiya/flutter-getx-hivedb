import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../config/app_assets.dart';
import '../../config/app_values.dart';

class NetworkImageView extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;

  const NetworkImageView({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(
          AppValues.size_20,
        ),
        bottomLeft: Radius.circular(
          AppValues.size_20,
        ),
        bottomRight: Radius.circular(
          AppValues.size_20,
        ),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl!,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) => Image.asset(
          AppAssets.placeholderImg,
          width: width,
          height: height,
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
