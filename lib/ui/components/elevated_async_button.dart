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

  Future<void> _handleOnPressed() async {
    setState(() {
      _isRunning = true;
    });

    try {
      await widget.onPressed!();
    } finally {
      if (mounted) {
        setState(() {
          _isRunning = false;
        });
      }
    }
  }

  @override
  Widget build(final BuildContext context) => ElevatedButton(
    style: widget.style ?? Theme.of(context).elevatedButtonTheme.style,
    onPressed: widget.onPressed != null && !_isRunning
        ? _handleOnPressed
        : null,
    child: widget.child,
  );
}
