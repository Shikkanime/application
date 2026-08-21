import 'package:material_ui/material_ui.dart';

class AppBlurBadge extends StatelessWidget {
  const AppBlurBadge({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final badgeBackgroundColor = Theme.of(context).scaffoldBackgroundColor
        .withValues(alpha: 0.4);

    return ClipRRect(
      borderRadius: const .all(.circular(8)),
      child: BackdropFilter(
        filter: .blur(sigmaX: 8, sigmaY: 8),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: badgeBackgroundColor,
            border: .all(color: badgeBackgroundColor, width: 0.5),
            borderRadius: const .all(.circular(8)),
          ),
          child: Padding(
            padding: const .symmetric(horizontal: 8, vertical: 4),
            child: child,
          ),
        ),
      ),
    );
  }
}
