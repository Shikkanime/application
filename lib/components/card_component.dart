import 'package:application/utils/constant.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final Widget child;
  final Color? backgroundColor;
  final Function()? onTap;
  final Function(TapDownDetails?)? onLongPress;
  final bool activateLayers;
  final Color? layerColor;
  final bool horizontalPadding;

  const CustomCard({
    super.key,
    required this.child,
    this.backgroundColor,
    this.onTap,
    this.onLongPress,
    this.activateLayers = false,
    this.layerColor,
    this.horizontalPadding = true,
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
        padding: EdgeInsets.only(
          left: widget.horizontalPadding ? 8 : 0,
          right: widget.horizontalPadding ? 8 : 0,
          top: widget.activateLayers ? 8 : 4,
          bottom: 4,
        ),
        child: Stack(
          fit: StackFit.passthrough,
          clipBehavior: Clip.none,
          children: [
            if (widget.activateLayers && widget.layerColor != null) ...[
              Positioned(
                top: -8,
                left: 12,
                right: 12,
                height: 100,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(Constant.borderRadius)),
                    color: widget.layerColor!.withOpacity(0.5),
                  ),
                ),
              ),
              Positioned(
                top: -4,
                left: 6,
                right: 6,
                height: 100,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(Constant.borderRadius)),
                    color: widget.layerColor!,
                  ),
                ),
              ),
            ],
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                    Radius.circular(Constant.borderRadius)),
                color: widget.backgroundColor ?? withOpacity,
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
          ],
        ),
      ),
    );
  }
}
