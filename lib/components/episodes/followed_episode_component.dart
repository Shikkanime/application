import 'package:application/components/episodes/episode_image.dart';
import 'package:application/components/episodes/episode_information_component.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/utils/analytics.dart';
import 'package:application/utils/constant.dart';
import 'package:application/views/anime_details_view.dart';
import 'package:flutter/material.dart';

double _ratio = 4;

class FollowedEpisodeComponent extends StatelessWidget {
  final EpisodeMappingDto episode;

  const FollowedEpisodeComponent({
    super.key,
    required this.episode,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 640 / _ratio + 10,
      child: GestureDetector(
        onTap: () {
          if (episode.anime == null) {
            return;
          }

          Analytics.instance.logSelectContent('anime', episode.anime!.uuid);

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AnimeDetailsView(anime: episode.anime!),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 640 / _ratio,
              height: 360 / _ratio,
              child: EpisodeImage(
                episode: episode,
                fit: BoxFit.fill,
                borderRadius: const BorderRadius.all(
                    Radius.circular(Constant.borderRadius)),
                showDuration: false,
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    episode.anime?.shortName ?? Constant.defaultText,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                  EpisodeInformation(episode: episode),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
