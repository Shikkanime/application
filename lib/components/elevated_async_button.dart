import 'package:flutter/material.dart';

class ElevatedAsyncButton extends StatefulWidget {
  const ElevatedAsyncButton({required this.child, super.key, this.onPressed});

  final Future<void> Function()? onPressed;
  final Widget child;

  @override
  State<ElevatedAsyncButton> createState() => _ElevatedAsyncButtonState();
}

class _ElevatedAsyncButtonState extends State<ElevatedAsyncButton> {
  bool _isRunning = false;

  @override
  Widget build(final BuildContext context) => ElevatedButton(
        onPressed: !_isRunning
            ? () async {
                setState(() {
                  _isRunning = true;
                });

                if (widget.onPressed != null) {
                  await widget.onPressed!();
                }

                setState(() {
                  _isRunning = false;
                });
              }
            : null,
        child: widget.child,
      );
}
