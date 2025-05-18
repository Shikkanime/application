import 'package:application/components/card_component.dart';
import 'package:application/utils/extensions.dart';
import 'package:flutter/material.dart';

class SettingsCategory extends StatelessWidget {
  const SettingsCategory({
    required this.icon,
    required this.title,
    required this.options,
    this.separator = false,
    super.key,
  });

  final IconData icon;
  final String title;
  final List<Widget> options;
  final bool separator;

  @override
  Widget build(final BuildContext context) => Column(
    spacing: 8,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Flex(
          spacing: 8,
          direction: Axis.horizontal,
          children: <Widget>[
            Icon(icon, color: Colors.grey),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      CustomCard(
        child: Column(
          children:
              separator ? options.joinTo(const Divider()) : options,
        ),
      ),
    ],
  );
}
