import 'package:application/components/cached_image.dart';
import 'package:application/dtos/enums/image_type.dart';
import 'package:application/utils/constant.dart';
import 'package:flutter/material.dart';

class ImageComponent extends StatelessWidget {
  const ImageComponent({
    super.key,
    this.uuid,
    this.type,
    this.imageUrl,
    this.fit = BoxFit.fill,
    this.version,
    this.borderRadius = BorderRadius.zero,
    this.width = double.infinity,
    this.height,
    this.placeholderWidget,
    this.placeholderHeight,
  });

  final String? uuid;
  final ImageType? type;
  final String? imageUrl;

  final BoxFit fit;
  final String? version;
  final BorderRadius borderRadius;
  final double? width;
  final double? height;
  final Widget? placeholderWidget;
  final double? placeholderHeight;

  @override
  Widget build(final BuildContext context) {
    assert((uuid != null && type != null) || imageUrl != null,
        'Either uuid and type or url must be provided');

    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedImage(
        imageUrl: imageUrl ?? buildImageUrl,
        filterQuality: FilterQuality.high,
        fit: fit,
        width: width,
        height: height,
        placeholderWidget:
            placeholderWidget ??
            Container(
              color: Colors.grey,
              width: width,
              height: placeholderHeight ?? height,
            ),
        errorWidget: Container(
          color: Colors.grey,
          width: width,
          height: placeholderHeight ?? height,
        ),
      ),
    );
  }

  String get buildImageUrl =>
      '${Constant.apiUrl}/v1/attachments?uuid=$uuid&type=${type?.value}${version != null ? '&v=$version' : ''}';
}
