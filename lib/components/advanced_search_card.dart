import 'package:application/components/lang_type_component.dart';
import 'package:application/controllers/anime_search_controller.dart';
import 'package:application/l10n/generated/app_localizations.dart';
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
  Widget build(final BuildContext context) => Scrollbar(
        controller: scrollController,
        child: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 8,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (final BuildContext context) => AlertDialog(
                      title: Text(AppLocalizations.of(context)!.advancedSearch),
                      content: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 8,
                        runSpacing: 8,
                        children: <Widget>[
                          for (final String letter in _letters)
                            ActionChip(
                              label: Text(letter),
                              onPressed: () {
                                AnimeSearchController.instance.search(letter);
                                controller.text = letter;
                              },
                            ),
                        ],
                      ),
                    ),
                  );
                },
                child: const Icon(Icons.tune),
              ),
              for (final SearchType type in SearchType.values)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AnimeSearchController.instance.searchType == type
                            ? Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.color
                                ?.withValues(alpha: 0.1)
                            : Theme.of(context)
                                .elevatedButtonTheme
                                .style
                                ?.backgroundColor
                                ?.resolve(<WidgetState>{}),
                  ),
                  onPressed: () {
                    if (AnimeSearchController.instance.searchType == type) {
                      AnimeSearchController.instance.searchType = null;
                    } else {
                      AnimeSearchController.instance.searchType = type;
                    }

                    AnimeSearchController.instance.search(
                      AnimeSearchController.instance.query,
                    );
                  },
                  child: LangTypeComponent(
                    langType: type.name.toUpperCase(),
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
            ],
          ),
        ),
      );
}
