import 'package:application/components/card_component.dart';
import 'package:application/components/image_component.dart';
import 'package:application/components/lang_type_component.dart';
import 'package:application/components/platforms/platform_component.dart';
import 'package:application/components/watchlist_button.dart';
import 'package:application/controllers/animes/anime_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/enums/image_type.dart';
import 'package:application/utils/analytics.dart';
import 'package:application/utils/constant.dart';
import 'package:application/utils/extensions.dart';
import 'package:application/views/anime_details_view.dart';
import 'package:flutter/material.dart';

class AnimeComponent extends StatelessWidget {
  const AnimeComponent({
    required this.anime,
    super.key,
    this.showWatchlist = true,
  });

  final AnimeDto anime;
  final bool showWatchlist;

  @override
  Widget build(final BuildContext context) => CustomCard(
    onTap: () {
      Analytics.instance.logSelectContent('anime', anime.uuid);

      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (final BuildContext context) =>
              AnimeDetailsView(anime: anime),
        ),
      );
    },
    onLongPress: (final TapDownDetails? details) {
      AnimeController.instance.onLongPress(context, anime, details);
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(
          children: <Widget>[
            ImageComponent(
              uuid: anime.uuid,
              type: ImageType.thumbnail,
              borderRadius: const BorderRadius.all(
                Radius.circular(Constant.borderRadius),
              ),
              placeholderHeight: AnimeController.instance.placeholderHeight(
                context,
              ),
            ),
            ...PlatformComponent.toPlatformsRow(anime.platforms),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          anime.shortName,
          style: Theme.of(context).textTheme.bodyLarge,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        ...?anime.langTypes?.map(
          (final String langType) => LangTypeComponent(langType: langType),
        ),
        if (showWatchlist) ...<Widget>[
          const SizedBox(height: 8),
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              WatchlistButton(
                anime: anime.uuid,
                isAnime: true,
                style: Theme.of(context).cardButtonStyle,
              ),
            ],
          ),
        ],
      ],
    ),
  );
}
