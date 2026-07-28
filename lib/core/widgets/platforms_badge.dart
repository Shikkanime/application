import 'package:application/core/widgets/app_blur_badge.dart';
import 'package:application/core/widgets/app_skeleton.dart';
import 'package:application/core/widgets/cached_network_image.dart';
import 'package:application/models/platform_model.dart';
import 'package:material_ui/material_ui.dart';

class PlatformsBadge extends StatelessWidget {
  const PlatformsBadge({
    super.key,
    required this.platforms,
    this.width = 16,
    this.height = 16,
    this.widthOffset = 7.5,
    this.heightOffset = 5,
  });

  final Iterable<PlatformModel> platforms;
  final double width;
  final double height;
  final double widthOffset;
  final double heightOffset;

  @override
  Widget build(BuildContext context) {
    return AppBlurBadge(
      child: SizedBox(
        width: width + (platforms.length - 1) * widthOffset,
        height: height + (platforms.length - 1) * heightOffset,
        child: Stack(
          children: [
            for (final (index, platform) in platforms.indexed)
              Positioned(
                left: index * widthOffset,
                top: index * heightOffset,
                child: ClipOval(
                  child: CachedNetworkImage(
                    'https://www.shikkanime.fr/assets/img/platforms/${platform.image}',
                    width: width,
                    height: height,
                    fit: .cover,
                    loading: const AppSkeleton(),
                    error: const AppSkeleton(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
