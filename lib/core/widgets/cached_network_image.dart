import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

final _cacheManager = CacheManager(
  Config(
    'shikkanime_image_cache',
    stalePeriod: const Duration(days: 7),
    maxNrOfCacheObjects: 1000,
  ),
);

class CachedNetworkImage extends StatefulWidget {
  const CachedNetworkImage(
    this.src, {
    super.key,
    this.loading,
    this.error,
    this.width,
    this.height,
    this.fit,
  });

  final String src;
  final Widget? loading;
  final Widget? error;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  State<StatefulWidget> createState() => _CachedNetworkImageState();
}

class _CachedNetworkImageState extends State<CachedNetworkImage> {
  late Future<File> _imageFile;

  @override
  void initState() {
    _imageFile = _cacheManager.getSingleFile(widget.src);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CachedNetworkImage oldWidget) {
    if (oldWidget.src != widget.src) {
      _imageFile = _cacheManager.getSingleFile(widget.src);
    }

    super.didUpdateWidget(oldWidget);
  }

  Widget _buildImage(ImageProvider imageProvider) {
    return Image(
      image: imageProvider,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      isAntiAlias: true,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (!(wasSynchronouslyLoaded || frame != null)) {
          return widget.loading ??
              const Center(child: CircularProgressIndicator());
        }

        return child;
      },
      errorBuilder: (context, error, stackTrace) {
        return widget.error ?? const Center(child: Icon(Icons.error));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return _buildImage(NetworkImage(widget.src));
    }

    return FutureBuilder(
      future: _imageFile,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return widget.loading ??
              const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError || !snapshot.hasData) {
          return widget.error ?? const Center(child: Icon(Icons.error));
        }

        return _buildImage(FileImage(snapshot.data!));
      },
    );
  }
}
