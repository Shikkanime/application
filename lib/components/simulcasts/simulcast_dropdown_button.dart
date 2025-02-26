import 'package:application/components/elevated_dropdown_button.dart';
import 'package:application/controllers/animes/anime_controller.dart';
import 'package:application/controllers/simulcast_controller.dart';
import 'package:application/dtos/simulcast_dto.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:application/utils/analytics.dart';
import 'package:flutter/material.dart';

class SimulcastDropdownButton extends StatelessWidget {
  const SimulcastDropdownButton({super.key});

  @override
  Widget build(final BuildContext context) => StreamBuilder<List<SimulcastDto>>(
    stream: SimulcastController.instance.streamController.stream,
    initialData: SimulcastController.instance.items,
    builder: (
      final BuildContext context,
      final AsyncSnapshot<List<SimulcastDto>> snapshot,
    ) {
      if (snapshot.data!.isEmpty ||
          AnimeController.instance.selectedSimulcast == null) {
        return const SizedBox.shrink();
      }

      return Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedDropdownButton<SimulcastDto>(
              globalKey: GlobalKey(),
              value: AnimeController.instance.selectedSimulcast,
              items: <ElevatedPopupMenuItem<SimulcastDto>>[
                for (final SimulcastDto simulcast
                    in SimulcastController.instance.items)
                  ElevatedPopupMenuItem<SimulcastDto>(
                    value: simulcast,
                    child: Text(
                      AppLocalizations.of(
                        context,
                      )!.simulcastSeason(simulcast.season, simulcast.year),
                    ),
                  ),
              ],
              onChanged: (final SimulcastDto value) {
                Analytics.instance.logSelectContent('simulcast', value.uuid);
                AnimeController.instance.selectedSimulcast = value;
                AnimeController.instance.goToTop();
              },
            ),
          ],
        ),
      );
    },
  );
}
