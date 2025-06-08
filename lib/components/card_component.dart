import 'package:application/components/custom_gesture_detector.dart';
import 'package:application/utils/constant.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.child,
    super.key,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.padding = true,
    this.isSelected = false,
  });

  final Widget child;
  final Function()? onTap;
  final Function()? onDoubleTap;
  final Function(TapDownDetails?)? onLongPress;
  final bool padding;
  final bool isSelected;

  @override
  Widget build(final BuildContext context) {
    final Color selectedColor = Theme.of(context).colorScheme.primary;

    final Padding mainComponent = Padding(
      padding: EdgeInsets.symmetric(
        vertical: padding ? 4 : 0,
        horizontal: padding ? 8 : 0,
      ),
      child: CustomGestureDetector(
        onTap: onTap,
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: isSelected
                ? Border.all(color: selectedColor, width: 2)
                : null,
            borderRadius: const BorderRadius.all(
              Radius.circular(Constant.borderRadius + 8),
            ),
            color: Theme.of(context).canvasColor,
          ),
          child: Padding(padding: const EdgeInsets.all(8), child: child),
        ),
      ),
    );

    return RepaintBoundary(
      child: isSelected
          ? Stack(
              children: <Widget>[
                mainComponent,
                Positioned(
                  top: 0,
                  right: 2.5,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: selectedColor,
                      border: Border.all(color: selectedColor, width: 2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(Constant.borderRadius),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Icon(
                        Icons.check,
                        color: Theme.of(context).canvasColor,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : mainComponent,
    );
  }
}
