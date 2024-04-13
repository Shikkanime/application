import 'package:flutter/material.dart';

class Card extends StatelessWidget {
  final Widget child;

  const Card({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.125),
          ),
          child: child,
        ),
      ),
    );
  }
}
