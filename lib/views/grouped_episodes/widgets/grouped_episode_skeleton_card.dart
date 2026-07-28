import 'package:application/core/widgets/app_skeleton.dart';
import 'package:application/core/widgets/app_card.dart';
import 'package:application/core/widgets/lang_types/lang_type_skeleton_label.dart';
import 'package:material_ui/material_ui.dart';

class GroupedEpisodeSkeletonCard extends StatelessWidget {
  const GroupedEpisodeSkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppCard(
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        spacing: 8,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: AppSkeleton(borderRadius: .all(.circular(16))),
          ),
          AppSkeleton(width: 100, height: 16, borderRadius: .all(.circular(8))),
          AppSkeleton(width: 125, height: 16, borderRadius: .all(.circular(8))),
          LangTypeSkeletonLabel(),
        ],
      ),
    );
  }
}
