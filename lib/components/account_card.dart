import 'package:application/utils/constant.dart';
import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({
    required this.label,
    required this.value,
    super.key,
    this.children,
  });

  final String label;
  final String value;
  final List<Widget>? children;

  @override
  Widget build(final BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(Constant.borderRadius + 8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Text(
                value,
                style: TextStyle(
                  color: Theme.of(context).textTheme.titleLarge!.color,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                label,
                style: TextStyle(
                  color: Theme.of(context).textTheme.titleLarge!.color,
                ),
              ),
              if (children != null) ...children!,
            ],
          ),
        ),
      );
}
