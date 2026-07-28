import 'package:application/core/widgets/app_skeleton.dart';
import 'package:application/core/widgets/app_card.dart';
import 'package:application/core/widgets/lang_types/lang_type_skeleton_label.dart';
import 'package:material_ui/material_ui.dart';

class AnimeSkeletonCard extends StatelessWidget {
  const AnimeSkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppCard(
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        spacing: 8,
        children: [
          AspectRatio(
            aspectRatio: 9 / 16,
            child: AppSkeleton(borderRadius: .all(.circular(16))),
          ),
          AppSkeleton(width: 100, height: 16, borderRadius: .all(.circular(8))),
          LangTypeSkeletonLabel(),
        ],
      ),
    );
  }
}
