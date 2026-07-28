import 'package:application/core/widgets/app_skeleton.dart';
import 'package:application/core/widgets/app_card.dart';
import 'package:application/core/widgets/lang_types/lang_type_skeleton_label.dart';
import 'package:material_ui/material_ui.dart';

class ReleaseSkeletonCard extends StatelessWidget {
  const ReleaseSkeletonCard({super.key});

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
          IntrinsicHeight(
            child: Flex(
              direction: .horizontal,
              spacing: 4,
              children: [
                AppSkeleton(
                  width: 40,
                  height: 16,
                  borderRadius: .all(.circular(8)),
                ),
                VerticalDivider(thickness: 0.75),
                Expanded(
                  child: Column(
                    mainAxisSize: .min,
                    crossAxisAlignment: .start,
                    spacing: 8,
                    children: [
                      AppSkeleton(
                        width: 100,
                        height: 16,
                        borderRadius: .all(.circular(8)),
                      ),
                      LangTypeSkeletonLabel(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
