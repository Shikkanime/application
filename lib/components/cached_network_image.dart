import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CachedNetworkImage extends StatefulWidget {
  const CachedNetworkImage({
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

  @override
  State<CachedNetworkImage> createState() => _CachedNetworkImageState();
}

class _CachedNetworkImageState extends State<CachedNetworkImage> {
  static final CacheManager _cacheManager = CacheManager(
    Config('shikkanime_image_cache', stalePeriod: const Duration(days: 7)),
  );

  late Future<File> _imageFuture;

  @override
  void initState() {
    super.initState();
    _imageFuture = _cacheManager.getSingleFile(widget.imageUrl);
  }

  @override
  void didUpdateWidget(covariant final CachedNetworkImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imageUrl != widget.imageUrl) {
      _imageFuture = _cacheManager.getSingleFile(widget.imageUrl);
    }
  }

  @override
  Widget build(final BuildContext context) => FutureBuilder<File>(
    future: _imageFuture,
    builder: (final BuildContext context, final AsyncSnapshot<File> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return widget.placeholderWidget ?? const SizedBox.shrink();
      }
      if (snapshot.hasError || !snapshot.hasData) {
        return widget.errorWidget ?? const SizedBox.shrink();
      }
      return Image.file(
        snapshot.data!,
        fit: widget.fit,
        width: widget.width,
        height: widget.height,
        filterQuality: widget.filterQuality,
        frameBuilder:
            (
              final BuildContext context,
              final Widget child,
              final int? frame,
              final bool wasSynchronouslyLoaded,
            ) => (wasSynchronouslyLoaded || frame != null)
            ? child
            : (widget.placeholderWidget ?? const SizedBox.shrink()),
      );
    },
  );
}
