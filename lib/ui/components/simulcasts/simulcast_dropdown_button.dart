import 'package:application/ui/components/elevated_dropdown_button.dart';
import 'package:application/ui/components/horizontal_list_view.dart';
import 'package:application/ui/components/search_type_filter.dart';
import 'package:application/ui/viewmodels/animes/anime_controller.dart';
import 'package:application/ui/viewmodels/simulcast_controller.dart';
import 'package:application/data/models/simulcast_dto.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:application/core/analytics/analytics.dart';
import 'package:flutter/material.dart';

class SimulcastDropdownButton extends StatelessWidget {
  const SimulcastDropdownButton({required this.scrollController, super.key});

  final ScrollController scrollController;

  @override
  Widget build(final BuildContext context) {
    final AnimeController animeController = AnimeController.instance;

    return HorizontalListView(
      scrollController: scrollController,
      children: <Widget>[
        StreamBuilder<List<SimulcastDto>>(
          stream: SimulcastController.instance.streamController.stream,
          initialData: SimulcastController.instance.items,
          builder:
              (
                final BuildContext context,
                final AsyncSnapshot<List<SimulcastDto>> snapshot,
              ) {
                if (snapshot.data!.isEmpty ||
                    animeController.selectedSimulcast == null) {
                  return const SizedBox.shrink();
                }

                return ElevatedDropdownButton<SimulcastDto>(
                  globalKey: GlobalKey(),
                  value: animeController.selectedSimulcast,
                  items: SimulcastController.instance.items
                      .map(
                        (final SimulcastDto simulcast) =>
                            ElevatedPopupMenuItem<SimulcastDto>(
                              value: simulcast,
                              child: Text(
                                AppLocalizations.of(context)!.simulcastSeason(
                                  simulcast.season,
                                  simulcast.year,
                                ),
                              ),
                            ),
                      )
                      .toList(),
                  onChanged: (final SimulcastDto value) {
                    Analytics.instance.logSelectContent(
                      'simulcast',
                      value.uuid,
                    );

                    animeController
                      ..selectedSimulcast = value
                      ..goToTop();
                  },
                );
              },
        ),
        const VerticalDivider(thickness: 0.5),
        SearchTypeFilter(controller: animeController),
      ],
    );
  }
}
