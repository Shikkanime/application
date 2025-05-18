import 'package:flutter/material.dart';

class SettingsOption extends StatelessWidget {
  const SettingsOption({
    required this.title,
    super.key,
    this.subtitle,
    this.tooltip,
    this.trailing,
    this.onTap,
    this.leading,
  });

  final String title;
  final String? subtitle;
  final String? tooltip;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(final BuildContext context) => ListTile(
    title: Flex(
      spacing: 8,
      direction: Axis.horizontal,
      children: <Widget>[
        Text(title),
        if (tooltip != null)
          Tooltip(
            message: tooltip,
            child: const Icon(Icons.info_outline, size: 20, color: Colors.grey),
          ),
      ],
    ),
    subtitle:
        (subtitle != null && subtitle!.isNotEmpty) ? Text(subtitle!) : null,
    leading: leading,
    trailing: trailing,
    onTap: onTap,
  );
}
