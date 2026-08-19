import 'package:application/core/widgets/app_card.dart';
import 'package:application/core/widgets/lang_types/lang_type_filter.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:application/viewmodels/weekly_view_model.dart';
import 'package:application/views/weekly/widgets/release_card.dart';
import 'package:application/views/weekly/widgets/release_skeleton_card.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class WeeklyView extends StatefulWidget {
  const WeeklyView({super.key});

  @override
  State<StatefulWidget> createState() => _WeeklyViewState();
}

class _WeeklyViewState extends State<WeeklyView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeeklyViewModel>().init();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<WeeklyViewModel>();

    return Column(
      mainAxisSize: .max,
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        AppCard(
          child: Flex(
            direction: .horizontal,
            spacing: 4,
            mainAxisSize: .max,
            mainAxisAlignment: .spaceBetween,
            children: [
              TextButton(
                onPressed: viewModel.setPreviousDay,
                child: const Icon(Icons.chevron_left),
              ),
              Text(
                AppLocalizations.of(context)!
                    .weekDays(viewModel.selectedDay.toString()),
              ),
              TextButton(
                onPressed: viewModel.setNextDay,
                child: const Icon(Icons.chevron_right),
              ),
            ],
          ),
        ),
        const LangTypeFilter<WeeklyViewModel>(),
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
                child: AlignedGridView.count(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  itemCount: viewModel.length,
                  itemBuilder: (context, index) {
                    final release = viewModel.getOrNull(index);

                    // Loading component
                    if (release == null) {
                      return const ReleaseSkeletonCard();
                    }

                    return Align(
                      alignment: .topCenter,
                      child: ReleaseCard(release),
                    );
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
