import 'package:material_ui/material_ui.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class AppSkeleton extends StatelessWidget {
  const AppSkeleton({super.key, this.borderRadius, this.width, this.height});

  final BorderRadius? borderRadius;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: Shimmer(
          colorOpacity: 1,
          color: Theme.of(context).canvasColor,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
