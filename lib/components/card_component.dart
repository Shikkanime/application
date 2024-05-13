import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final Widget child;
  final Color? backgroundColor;
  final Function()? onTap;
  final Function(TapDownDetails?)? onLongPress;

  const CustomCard({
    super.key,
    required this.child,
    this.backgroundColor,
    this.onTap,
    this.onLongPress,
  });

  @override
  State<StatefulWidget> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  TapDownDetails? _tapDownDetails;

  @override
  Widget build(BuildContext context) {
    final withOpacity =
        Theme.of(context).colorScheme.secondary.withOpacity(0.125);

    return RepaintBoundary(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: widget.backgroundColor ?? withOpacity,
            border: Border.all(
              color: widget.backgroundColor ?? withOpacity,
              width: 1,
            ),
          ),
          child: GestureDetector(
            onTap: widget.onTap,
            onLongPress: () {
              widget.onLongPress?.call(_tapDownDetails);
            },
            onTapDown: (details) {
              _tapDownDetails = details;
            },
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
