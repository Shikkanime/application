import 'dart:math';

import 'package:application/components/animes/anime_component.dart';
import 'package:application/components/animes/anime_loader_component.dart';
import 'package:application/components/simulcasts/simulcast_dropdown_button.dart';
import 'package:application/components/simulcasts/simulcast_loader_button.dart';
import 'package:application/controllers/animes/anime_controller.dart';
import 'package:application/controllers/simulcast_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/utils/widget_builder.dart' as wb;
import 'package:flutter/material.dart';

class SimulcastView extends StatelessWidget {
  const SimulcastView({super.key});

  List<Widget> _buildAnimeList(
    final BuildContext context,
    final List<AnimeDto> animes,
  ) {
    final int maxElementsPerRow = max(
      2,
      (MediaQuery.sizeOf(context).width * 3 / 600).floor(),
    );

    if (animes.isEmpty) {
      return <Widget>[
        const SimulcastLoaderButton(),
        ...wb.WidgetBuilder.instance.buildRowWidgets(
          List<AnimeLoaderComponent>.generate(
            12,
            (final int index) => const AnimeLoaderComponent(),
          ),
          maxElementsPerRow: maxElementsPerRow,
        ),
      ];
    }

    return <Widget>[
      const SimulcastDropdownButton(),
      ...wb.WidgetBuilder.instance.buildRowWidgets(
        animes.map((final AnimeDto anime) => AnimeComponent(anime: anime)),
        maxElementsPerRow: maxElementsPerRow,
      ),
    ];
  }

  @override
  Widget build(final BuildContext context) => StreamBuilder<List<AnimeDto>>(
    stream: AnimeController.instance.streamController.stream,
    initialData: AnimeController.instance.items,
    builder: (
      final BuildContext context,
      final AsyncSnapshot<List<AnimeDto>> snapshot,
    ) {
      final List<Widget> list = _buildAnimeList(context, snapshot.data!);

      return RefreshIndicator.adaptive(
        onRefresh: () async {
          await Future.wait(<Future<void>>[
            SimulcastController.instance.init(),
            AnimeController.instance.init(),
          ]);
        },
        child: ListView.builder(
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: false,
          controller: AnimeController.instance.scrollController,
          itemCount: list.length,
          itemBuilder:
              (final BuildContext context, final int index) => list[index],
        ),
      );
    },
  );
}
