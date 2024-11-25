import 'package:application/components/card_component.dart';
import 'package:application/components/image_component.dart';
import 'package:application/components/lang_type_component.dart';
import 'package:application/components/watchlist_button.dart';
import 'package:application/controllers/anime_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/utils/analytics.dart';
import 'package:application/utils/constant.dart';
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
              builder: (final BuildContext context) => AnimeDetailsView(
                anime: anime,
              ),
            ),
          );
        },
        onLongPress: (final TapDownDetails? details) {
          AnimeController.instance.onLongPress(context, anime, details);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ImageComponent(
              fit: BoxFit.cover,
              uuid: anime.uuid,
              height: 280,
              borderRadius: const BorderRadius.all(
                Radius.circular(Constant.borderRadius),
              ),
            ),
            Text(
              anime.shortName,
              style: Theme.of(context).textTheme.bodyLarge,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            if (anime.langTypes != null)
              for (final String langType in anime.langTypes!)
                LangTypeComponent(langType: langType),
            if (showWatchlist) ...<Widget>[
              const SizedBox(height: 8),
              Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  WatchlistButton(anime: anime),
                ],
              ),
            ],
          ],
        ),
      );
}
