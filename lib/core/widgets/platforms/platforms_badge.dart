import 'package:application/core/widgets/app_blur_badge.dart';
import 'package:application/core/widgets/platforms/platforms_stack.dart';
import 'package:application/models/platform_model.dart';
import 'package:material_ui/material_ui.dart';

class PlatformsBadge extends StatelessWidget {
  const PlatformsBadge({super.key, required this.platforms});

  final Iterable<PlatformModel> platforms;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      left: 8,
      child: AppBlurBadge(child: PlatformsStack(platforms: platforms)),
    );
  }
}
