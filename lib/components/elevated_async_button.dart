import 'package:flutter/material.dart';

class ElevatedAsyncButton extends StatefulWidget {
  const ElevatedAsyncButton({
    required this.child,
    super.key,
    this.onPressed,
    this.style,
  });

  final ButtonStyle? style;
  final Future<void> Function()? onPressed;
  final Widget child;

  @override
  State<ElevatedAsyncButton> createState() => _ElevatedAsyncButtonState();
}

class _ElevatedAsyncButtonState extends State<ElevatedAsyncButton> {
  bool _isRunning = false;

  @override
  Widget build(final BuildContext context) => ElevatedButton(
    style: widget.style ?? Theme.of(context).elevatedButtonTheme.style,
    onPressed:
        widget.onPressed != null && !_isRunning
            ? () async {
              setState(() {
                _isRunning = true;
              });

              await widget.onPressed!();

              setState(() {
                _isRunning = false;
              });
            }
            : null,
    child: widget.child,
  );
}
