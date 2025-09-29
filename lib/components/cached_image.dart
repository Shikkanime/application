import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    required this.imageUrl,
    super.key,
    this.fit,
    this.width,
    this.height,
    this.placeholderWidget,
    this.errorWidget,
    this.filterQuality = FilterQuality.medium,
  });

  final String imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Widget? placeholderWidget;
  final Widget? errorWidget;
  final FilterQuality filterQuality;

  static final CacheManager _cacheManager = CacheManager(
    Config('shikkanime_image_cache', stalePeriod: const Duration(days: 7)),
  );

  @override
  Widget build(final BuildContext context) => FutureBuilder<File>(
    future: _cacheManager.getSingleFile(imageUrl),
    builder: (final BuildContext context, final AsyncSnapshot<File> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return placeholderWidget ?? const SizedBox.shrink();
      }
      if (snapshot.hasError || !snapshot.hasData) {
        return errorWidget ?? const SizedBox.shrink();
      }
      return Image.file(
        snapshot.data!,
        fit: fit,
        width: width,
        height: height,
        filterQuality: filterQuality,
        frameBuilder:
            (
              final BuildContext context,
              final Widget child,
              final int? frame,
              final bool wasSynchronouslyLoaded,
            ) => (wasSynchronouslyLoaded || frame != null)
            ? child
            : (placeholderWidget ?? const SizedBox.shrink()),
      );
    },
  );
}
