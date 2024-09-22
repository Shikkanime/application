import 'package:application/utils/constant.dart';
import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  final String label;
  final String value;
  final List<Widget>? children;

  const AccountCard({
    super.key,
    required this.label,
    required this.value,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius:
            const BorderRadius.all(Radius.circular(Constant.borderRadius)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                color: Theme.of(context).textTheme.titleLarge!.color!,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                color: Theme.of(context).textTheme.titleLarge!.color!,
              ),
            ),
            if (children != null) ...children!,
          ],
        ),
      ),
    );
  }
}
