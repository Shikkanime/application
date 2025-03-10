import 'package:application/dtos/enums/image_type.dart';
import 'package:application/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageComponent extends StatelessWidget {
  const ImageComponent({
    required this.uuid,
    required this.type,
    super.key,
    this.fit = BoxFit.fill,
    this.version,
    this.borderRadius = BorderRadius.zero,
    this.width = double.infinity,
    this.placeholderHeight,
    this.height,
    this.placeholder,
  });

  final String uuid;
  final BoxFit fit;
  final ImageType type;
  final String? version;
  final BorderRadius borderRadius;
  final double? width;
  final double? placeholderHeight;
  final double? height;
  final Widget? placeholder;

  @override
  Widget build(final BuildContext context) => ClipRRect(
    borderRadius: borderRadius,
    child: CachedNetworkImage(
      imageUrl:
          '${Constant.apiUrl}/v1/attachments?uuid=$uuid&type=${type.value}${version != null ? '&v=$version' : ''}',
      filterQuality: FilterQuality.high,
      fit: fit,
      width: width,
      height: height,
      placeholder:
          (final BuildContext context, final String url) =>
              placeholder ??
              Container(
                color: Colors.grey,
                width: width,
                height: placeholderHeight ?? height,
              ),
      errorWidget:
          (final BuildContext context, final String url, final dynamic error) =>
              Container(
                color: Colors.grey,
                width: width,
                height: placeholderHeight ?? height,
              ),
    ),
  );
}
