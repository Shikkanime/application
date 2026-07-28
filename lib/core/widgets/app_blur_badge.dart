import 'package:material_ui/material_ui.dart';

class AppBlurBadge extends StatelessWidget {
  const AppBlurBadge({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final badgeBackgroundColor = Theme.of(context).scaffoldBackgroundColor
        .withValues(alpha: 0.3);

    return ClipRRect(
      borderRadius: const .all(.circular(16)),
      child: BackdropFilter(
        filter: .blur(sigmaX: 8, sigmaY: 8),
        child: DecoratedBox(
          decoration: BoxDecoration(color: badgeBackgroundColor),
          child: Padding(
            padding: const .symmetric(horizontal: 8, vertical: 4),
            child: child,
          ),
        ),
      ),
    );
  }
}
