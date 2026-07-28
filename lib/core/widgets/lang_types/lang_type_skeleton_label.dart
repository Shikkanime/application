import 'package:application/core/widgets/app_skeleton.dart';
import 'package:material_ui/material_ui.dart';

class LangTypeSkeletonLabel extends StatelessWidget {
  const LangTypeSkeletonLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppSkeleton(
      width: 75,
      height: 16,
      borderRadius: .all(.circular(8)),
    );
  }
}
