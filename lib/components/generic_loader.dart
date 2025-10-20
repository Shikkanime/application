import 'package:application/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class GenericLoader extends StatelessWidget {
  const GenericLoader({super.key, this.borderRadius, this.height, this.width});

  final double? borderRadius;
  final double? width;
  final double? height;

  @override
  Widget build(final BuildContext context) => SizedBox(
    width: width,
    height: height,
    child: ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius ?? Constant.borderRadius),
      ),
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
