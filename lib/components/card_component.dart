import 'package:application/components/custom_gesture_detector.dart';
import 'package:application/utils/constant.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.child,
    super.key,
    this.onTap,
    this.onLongPress,
    this.padding = true,
    this.margin = 8,
  });

  final Widget child;
  final Function()? onTap;
  final Function(TapDownDetails?)? onLongPress;
  final bool padding;
  final double margin;

  @override
  Widget build(final BuildContext context) => RepaintBoundary(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: padding ? 4 : 0,
            horizontal: padding ? 8 : 0,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(Constant.borderRadius + margin),
              ),
              color: Theme.of(context).canvasColor,
            ),
            child: CustomGestureDetector(
              onTap: onTap,
              onLongPress: onLongPress,
              child: Padding(
                padding: EdgeInsets.all(margin),
                child: child,
              ),
            ),
          ),
        ),
      );
}
