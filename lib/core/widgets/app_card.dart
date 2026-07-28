import 'package:material_ui/material_ui.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const .all(.circular(24)),
        color: Theme.of(context).canvasColor,
      ),
      child: Padding(padding: const .all(8), child: child),
    );
  }
}
