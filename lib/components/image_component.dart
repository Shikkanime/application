import 'package:application/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageComponent extends StatelessWidget {
  final String uuid;
  final BoxFit fit;
  final String type;
  final BorderRadius borderRadius;
  final double width;
  final double height;
  final Function(ImageProvider<Object> imageProvider)? builder;
  final bool animate;

  const ImageComponent({
    super.key,
    required this.uuid,
    this.fit = BoxFit.fill,
    this.type = 'image',
    this.borderRadius = BorderRadius.zero,
    this.width = double.infinity,
    this.height = double.infinity,
    this.builder,
    this.animate = true,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        fadeInDuration:
            animate ? const Duration(milliseconds: 500) : Duration.zero,
        fadeOutDuration:
            animate ? const Duration(milliseconds: 1000) : Duration.zero,
        imageUrl: '${Constant.apiUrl}/v1/attachments?uuid=$uuid&type=$type',
        filterQuality: FilterQuality.high,
        fit: fit,
        width: width,
        height: height,
        placeholder: (context, url) => Container(
          color: Colors.grey,
          width: width,
          height: height,
        ),
        imageBuilder: (context, imageProvider) {
          if (builder != null) {
            builder!(imageProvider);
          }

          return Image(
            image: imageProvider,
            fit: fit,
            width: width,
            height: height,
          );
        },
      ),
    );
  }
}
