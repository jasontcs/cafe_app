import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

String priceToString(double price) {
  if (price == null) return '';

  return price >= 0 ? '\$' + price.toString() : '- \$' + (-price).toString();
}

class AppNetworkImage extends CachedNetworkImage {
  final String src;
  final BoxFit fit;
  AppNetworkImage(this.src, {this.fit})
      : super(
          imageUrl: src,
          fit: fit,
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator(value: downloadProgress.progress),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        );
}

void showAppSnackBar(BuildContext context, String text) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
