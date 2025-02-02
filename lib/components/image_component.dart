import 'package:application/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageComponent extends StatelessWidget {
  const ImageComponent({
    required this.uuid,
    super.key,
    this.fit = BoxFit.fill,
    this.type = 'image',
    this.version,
    this.borderRadius = BorderRadius.zero,
    this.width = double.infinity,
    this.height,
    this.placeholder,
    this.errorWidget,
  });

  final String uuid;
  final BoxFit fit;
  final String type;
  final String? version;
  final BorderRadius borderRadius;
  final double? width;
  final double? height;
  final Widget? placeholder;
  final Widget? errorWidget;

  @override
  Widget build(final BuildContext context) => ClipRRect(
        borderRadius: borderRadius,
        child: CachedNetworkImage(
          imageUrl:
              '${Constant.apiUrl}/v1/attachments?uuid=$uuid&type=$type${version != null ? '&v=$version' : ''}',
          filterQuality: FilterQuality.high,
          fit: fit,
          width: width,
          height: height,
          placeholder: (final BuildContext context, final String url) =>
              placeholder ??
              Container(
                color: Colors.grey,
                width: width,
                height: height,
              ),
          errorWidget: errorWidget != null
              ? (
                  final BuildContext context,
                  final String url,
                  final dynamic error,
                ) =>
                  errorWidget!
              : null,
        ),
      );
}
