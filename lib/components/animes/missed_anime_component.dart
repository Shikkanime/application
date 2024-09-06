import 'package:application/components/card_component.dart';
import 'package:application/components/image_component.dart';
import 'package:application/components/pill.dart';
import 'package:application/controllers/missed_anime_controller.dart';
import 'package:application/dtos/missed_anime_dto.dart';
import 'package:application/views/anime_details_view.dart';
import 'package:flutter/material.dart';

class MissedAnimeComponent extends StatelessWidget {
  final MissedAnimeDto missedAnime;

  const MissedAnimeComponent({
    super.key,
    required this.missedAnime,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      backgroundColor: Colors.transparent,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AnimeDetailsView(anime: missedAnime.anime),
          ),
        );
      },
      onLongPress: (details) {
        MissedAnimeController.instance
            .onLongPress(context, missedAnime, details);
      },
      child: SizedBox(
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 80,
              height: 80,
              child: Stack(
                children: [
                  ImageComponent(
                    uuid: missedAnime.anime.uuid,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(360),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Pill(count: missedAnime.episodeMissed),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                missedAnime.anime.shortName,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
