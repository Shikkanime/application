import 'package:application/components/card_component.dart';
import 'package:application/components/lang_type_component.dart';
import 'package:application/controllers/anime_search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AdvancedSearchCard extends StatelessWidget {
  const AdvancedSearchCard({required this.controller, super.key});

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

  @override
  Widget build(final BuildContext context) => CustomCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!.advancedSearch,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Center(
              child: Wrap(
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
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                for (final SearchType type in SearchType.values)
                  Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Checkbox(
                        value: AnimeSearchController.instance.searchTypes
                            .contains(type),
                        onChanged: (final bool? value) {
                          if (value!) {
                            AnimeSearchController.instance.searchTypes
                                .add(type);
                          } else {
                            AnimeSearchController.instance.searchTypes
                                .remove(type);
                          }

                          AnimeSearchController.instance.search(
                            AnimeSearchController.instance.query,
                          );
                        },
                      ),
                      Text(
                        LangTypeComponent.getLangTypeTranslation(
                          context,
                          type.name.toUpperCase(),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      );
}
