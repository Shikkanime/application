import 'package:application/components/custom_gesture_detector.dart';
import 'package:application/components/image_component.dart';
import 'package:application/components/pill.dart';
import 'package:application/controllers/anime_controller.dart';
import 'package:application/dtos/missed_anime_dto.dart';
import 'package:application/utils/analytics.dart';
import 'package:application/views/anime_details_view.dart';
import 'package:flutter/material.dart';

class MissedAnimeComponent extends StatelessWidget {
  const MissedAnimeComponent({
    required this.missedAnime,
    super.key,
  });

  final MissedAnimeDto missedAnime;

  @override
  Widget build(final BuildContext context) => CustomGestureDetector(
        onTap: () {
          Analytics.instance.logSelectContent('anime', missedAnime.anime.uuid);

          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (final BuildContext context) => AnimeDetailsView(
                anime: missedAnime.anime,
              ),
            ),
          );
        },
        onLongPress: (final TapDownDetails? details) {
          AnimeController.instance
              .onLongPress(context, missedAnime.anime, details);
        },
        child: SizedBox(
          width: 100,
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 80,
                height: 80,
                child: Stack(
                  children: <Widget>[
                    ImageComponent(
                      uuid: missedAnime.anime.uuid,
                      fit: BoxFit.cover,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(360)),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Pill(count: missedAnime.episodeMissed),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                missedAnime.anime.shortName,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
}
