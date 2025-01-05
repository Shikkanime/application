import 'package:flutter/material.dart';

class CustomGestureDetector extends StatefulWidget {
  const CustomGestureDetector({
    super.key,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.child,
  });

  final Function()? onTap;
  final Function()? onDoubleTap;
  final Function(TapDownDetails?)? onLongPress;
  final Widget? child;

  @override
  State<CustomGestureDetector> createState() => _CustomGestureDetectorState();
}

class _CustomGestureDetectorState extends State<CustomGestureDetector> {
  TapDownDetails? _tapDownDetails;

  @override
  Widget build(final BuildContext context) => GestureDetector(
        onTap: widget.onTap,
        onDoubleTap: widget.onDoubleTap,
        onLongPress: () {
          widget.onLongPress?.call(_tapDownDetails);
        },
        onTapDown: (final TapDownDetails details) {
          _tapDownDetails = details;
        },
        onSecondaryTapDown: (final TapDownDetails details) {
          _tapDownDetails = details;
        },
        onSecondaryTap: () {
          widget.onLongPress?.call(_tapDownDetails);
        },
        child: widget.child,
      );
}
