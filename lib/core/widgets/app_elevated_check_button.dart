import 'package:material_ui/material_ui.dart';

class AppElevatedCheckButton extends StatelessWidget {
  const AppElevatedCheckButton({
    super.key,
    required this.value,
    required this.onChanged,
    required this.child,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final style = value
        ? theme.elevatedButtonTheme.style?.copyWith(
            backgroundColor: .all(theme.colorScheme.primary),
          )
        : theme.elevatedButtonTheme.style;

    return ElevatedButton(
      style: style,
      onPressed: () => onChanged?.call(!value),
      child: child,
    );
  }
}
