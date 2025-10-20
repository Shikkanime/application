import 'package:application/components/lang_type_component.dart';
import 'package:application/controllers/animes/anime_search_controller.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:application/utils/extensions.dart';
import 'package:flutter/material.dart';

class AdvancedSearchCard extends StatelessWidget {
  const AdvancedSearchCard({
    required this.controller,
    required this.scrollController,
    super.key,
  });

  final TextEditingController controller;
  static const List<String> _letters = <String>[
    '#',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
  ];
  final ScrollController scrollController;

  @override
  Widget build(final BuildContext context) {
    const double spacing = 8;
    final AnimeSearchController animeSearchController =
        AnimeSearchController.instance;

    return Scrollbar(
      controller: scrollController,
      child: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        child: IntrinsicHeight(
          child: Row(
            spacing: spacing,
            children: <Widget>[
              _buildAdvancedSearchButton(context),
              const VerticalDivider(thickness: 0.5),
              ..._buildSearchTypeButtons(context, animeSearchController),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAdvancedSearchButton(final BuildContext context) =>
      ElevatedButton(
        onPressed: () => _showAdvancedSearchDialog(context),
        child: const Icon(Icons.tune),
      );

  void _showAdvancedSearchDialog(final BuildContext context) {
    showDialog(
      context: context,
      builder: (final BuildContext dialogContext) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.advancedSearch),
        content: Wrap(
          alignment: WrapAlignment.center,
          spacing: 8,
          runSpacing: 8,
          children: _letters
              .map(
                (final String letter) => ActionChip(
                  label: Text(letter),
                  onPressed: () {
                    AnimeSearchController.instance.search(letter);
                    controller.text = letter;
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  List<Widget> _buildSearchTypeButtons(
    final BuildContext context,
    final AnimeSearchController searchController,
  ) => SearchType.values
      .map(
        (final SearchType type) => ElevatedButton(
          style: _getButtonStyle(context, type, searchController),
          onPressed: () => _handleSearchTypePressed(type, searchController),
          child: LangTypeComponent(
            langType: type.name.toUpperCase(),
            color: _getTextColor(context, type, searchController),
          ),
        ),
      )
      .toList();

  ButtonStyle? _getButtonStyle(
    final BuildContext context,
    final SearchType type,
    final AnimeSearchController searchController,
  ) {
    if (searchController.searchType == type) {
      return Theme.of(context).elevatedButtonTheme.style?.copyWith(
        backgroundColor: WidgetStateProperty.all(
          Theme.of(context).colorScheme.primary,
        ),
      );
    }

    return null;
  }

  Color? _getTextColor(
    final BuildContext context,
    final SearchType type,
    final AnimeSearchController searchController,
  ) => searchController.searchType == type
      ? Theme.of(context).oppositeTextColor
      : Theme.of(context).colorScheme.primary;

  void _handleSearchTypePressed(
    final SearchType type,
    final AnimeSearchController searchController,
  ) {
    searchController
      ..searchType = searchController.searchType == type ? null : type
      ..search(searchController.query);
  }
}
