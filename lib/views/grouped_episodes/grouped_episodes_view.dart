import 'package:application/core/widgets/lang_types/lang_type_filter.dart';
import 'package:application/viewmodels/grouped_episode_view_model.dart';
import 'package:application/views/grouped_episodes/widgets/grouped_episode_card.dart';
import 'package:application/views/grouped_episodes/widgets/grouped_episode_skeleton_card.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class GroupedEpisodesView extends StatefulWidget {
  const GroupedEpisodesView({super.key});

  @override
  State<StatefulWidget> createState() => _GroupedEpisodesViewState();
}

class _GroupedEpisodesViewState extends State<GroupedEpisodesView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GroupedEpisodeViewModel>().init();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GroupedEpisodeViewModel>();

    return Column(
      mainAxisSize: .max,
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        const LangTypeFilter<GroupedEpisodeViewModel>(),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = switch (constraints.maxWidth) {
                >= 1100 => 3,
                >= 700 => 2,
                _ => 1,
              };

              return RefreshIndicator(
                onRefresh: () => viewModel.init(bypass: true),
                child: MasonryGridView.builder(
                  controller: viewModel.scrollController,
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                  ),
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  itemCount: viewModel.length,
                  itemBuilder: (context, index) {
                    final groupedEpisode = viewModel.getOrNull(index);

                    // Loading component
                    if (groupedEpisode == null) {
                      return const GroupedEpisodeSkeletonCard();
                    }

                    return GroupedEpisodeCard(groupedEpisode);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
