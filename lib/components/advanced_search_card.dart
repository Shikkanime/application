import 'package:application/components/search_type_filter.dart';
import 'package:application/controllers/animes/anime_search_controller.dart';
import 'package:application/l10n/app_localizations.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildAdvancedSearchButton(context),
              const VerticalDivider(thickness: 0.5),
              SearchTypeFilter(controller: animeSearchController),
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
}
