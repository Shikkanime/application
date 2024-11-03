import 'package:flutter/material.dart';

class CustomGestureDetector extends StatefulWidget {
  const CustomGestureDetector({
    super.key,
    this.onTap,
    this.onLongPress,
    this.child,
  });

  final Function()? onTap;
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
        onLongPress: () {
          widget.onLongPress?.call(_tapDownDetails);
        },
        onTapDown: (final TapDownDetails details) {
          _tapDownDetails = details;
        },
        child: widget.child,
      );
}
