import 'package:application/core/theme/app_theme_colors.dart';
import 'package:application/core/widgets/app_elevated_check_button.dart';
import 'package:application/core/widgets/app_horizontal_list_view.dart';
import 'package:application/core/widgets/lang_types/lang_type_label.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:application/models/lang_type.dart';
import 'package:application/viewmodels/anime_view_model.dart';
import 'package:application/views/catalog/widgets/anime_card.dart';
import 'package:application/views/catalog/widgets/anime_skeleton_card.dart';
import 'package:application/views/catalog/widgets/simulcast_dropdown_button.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class CatalogView extends StatefulWidget {
  const CatalogView({super.key});

  @override
  State<StatefulWidget> createState() => _CatalogViewState();
}

class _CatalogViewState extends State<CatalogView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AnimeViewModel>().init();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AnimeViewModel>();

    final inverseTextColor = Theme.of(context)
        .extension<AppThemeExtension>()
        ?.inverseTextColor;

    return Column(
      mainAxisSize: .max,
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        SearchBar(
          controller: viewModel.textEditingController,
          leading: const Icon(Icons.search),
          hintText: AppLocalizations.of(context)!.search,
        ),
        AppHorizontalListView(
          spacing: 8,
          mainAxisAlignment: .start,
          children: [
            SimulcastDropdownButton(
              simulcasts: viewModel.simulcasts,
              value: viewModel.selectedSimulcast,
              onChanged: viewModel.setSelectedSimulcast,
            ),
            for (final langType in LangType.values)
              AppElevatedCheckButton(
                value: viewModel.isLangTypeSelected(langType),
                onChanged: (value) => viewModel.onChanged(langType),
                child: LangTypeLabel(
                  langType,
                  color: viewModel.isLangTypeSelected(langType)
                      ? inverseTextColor
                      : null,
                ),
              ),
          ],
        ),
        if (!viewModel.isLoading &&
            viewModel.selectedSimulcast == null &&
            viewModel.simulcastSelectionInitialized)
          DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.yellow,
              borderRadius: .all(.circular(24)),
            ),
            child: Padding(
              padding: const .all(8),
              child: Flex(
                direction: .horizontal,
                mainAxisSize: .max,
                mainAxisAlignment: .center,
                spacing: 8,
                children: [
                  const Icon(Icons.warning, color: Colors.black),
                  Flexible(
                    child: Text(
                      AppLocalizations.of(context)!.warningCatalog,
                      style: Theme.of(context).textTheme.bodyMedium
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = switch (constraints.maxWidth) {
                >= 1100 => 6,
                >= 700 => 4,
                _ => 2,
              };

              return RefreshIndicator(
                onRefresh: () => viewModel.init(bypass: true),
                child: AlignedGridView.count(
                  crossAxisCount: crossAxisCount,
                  controller: viewModel.scrollController,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  itemCount: viewModel.length,
                  itemBuilder: (context, index) {
                    final anime = viewModel.getOrNull(index);

                    // Loading component
                    if (anime == null) {
                      return const AnimeSkeletonCard();
                    }

                    return Align(
                      alignment: .topCenter,
                      child: AnimeCard(anime),
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
