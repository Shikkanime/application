import 'package:application/core/config/env_config.dart';
import 'package:application/core/widgets/app_skeleton.dart';
import 'package:application/core/widgets/cached_network_image.dart';
import 'package:application/models/platform_model.dart';
import 'package:flutter/widgets.dart';

class PlatformImage extends StatelessWidget {
  const PlatformImage(this._platform, {super.key, this.width, this.height});

  final PlatformModel _platform;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        '${EnvConfig.baseUrl}/assets/img/platforms/${_platform.image}',
        width: width,
        height: height,
        fit: .cover,
        loading: const AppSkeleton(),
        error: const AppSkeleton(),
      ),
    );
  }
}
