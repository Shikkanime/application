import 'package:application/components/card_component.dart';
import 'package:application/components/lang_type_component.dart';
import 'package:application/controllers/anime_search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AdvancedSearchCard extends StatelessWidget {
  final TextEditingController controller;
  static const _letters = [
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
    'Z'
  ];

  const AdvancedSearchCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.advancedSearch,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 4,
              runSpacing: 4,
              children: [
                for (final letter in _letters)
                  ActionChip(
                    label: Text(letter),
                    onPressed: () {
                      AnimeSearchController.instance.search(letter);
                      controller.text = letter;
                    },
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (final type in SearchType.values)
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Checkbox(
                        value: AnimeSearchController.instance.searchTypes
                            .contains(type),
                        onChanged: (value) {
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
                            context, type.name.toUpperCase()),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
