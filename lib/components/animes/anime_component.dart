import 'package:application/components/card_component.dart';
import 'package:application/components/followed_stream_builder.dart';
import 'package:application/components/image_component.dart';
import 'package:application/components/lang_type_component.dart';
import 'package:application/controllers/anime_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:application/views/anime_details_view.dart';
import 'package:flutter/material.dart';

class AnimeComponent extends StatelessWidget {
  final AnimeDto anime;

  const AnimeComponent({
    super.key,
    required this.anime,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () {
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
                  uuid: anime.uuid,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
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
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
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
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              anime.shortName,
              style: Theme.of(context).textTheme.bodyLarge,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          if (anime.langTypes != null)
            for (final langType in anime.langTypes!)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: LangTypeComponent(langType: langType),
              ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
