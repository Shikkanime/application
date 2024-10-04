import 'package:application/components/card_component.dart';
import 'package:application/components/followed_stream_builder.dart';
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
  final AnimeDto anime;
  final bool showWatchlist;

  const AnimeComponent({
    super.key,
    required this.anime,
    this.showWatchlist = true,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () {
        Analytics.instance.logSelectContent('anime', anime.uuid);

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AnimeDetailsView(anime: anime),
          ),
        );
      },
      onLongPress: (details) {
        AnimeController.instance.onLongPress(context, anime, details);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 280,
            child: Stack(
              children: [
                ImageComponent(
                  fit: BoxFit.cover,
                  uuid: anime.uuid,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(Constant.borderRadius),
                    topRight: Radius.circular(Constant.borderRadius),
                  ),
                ),
                if (showWatchlist)
                  FollowedStreamBuilder(
                    anime: anime,
                    builder: (context, containsAnime, _) {
                      if (!containsAnime) {
                        return const SizedBox.shrink();
                      }

                      return Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(Constant.borderRadius),
                              bottomLeft:
                                  Radius.circular(Constant.borderRadius),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Icon(
                              Icons.bookmark,
                              color: containsAnime
                                  ? Constant.watchlistBookmarkColor
                                  : null,
                              size: 16,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  anime.shortName,
                  style: Theme.of(context).textTheme.bodyLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                if (anime.langTypes != null)
                  for (final langType in anime.langTypes!)
                    LangTypeComponent(langType: langType),
                if (showWatchlist)
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      WatchlistButton(anime: anime),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
