import 'package:application/dtos/episode_dto.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EpisodeComponent extends StatelessWidget {
  final EpisodeDto episode;

  const EpisodeComponent({
    super.key,
    required this.episode,
  });

  String _platformImage(BuildContext context) {
    switch (episode.platform) {
      case 'ANIM':
        return 'https://www.shikkanime.fr/assets/img/platforms/animation_digital_network.jpg';
      case 'CRUN':
        return 'https://www.shikkanime.fr/assets/img/platforms/crunchyroll.jpg';
      case 'DISN':
        return 'https://www.shikkanime.fr/assets/img/platforms/disneyplus.jpg';
      case 'NETF':
        return 'https://www.shikkanime.fr/assets/img/platforms/netflix.jpg';
      case 'PRIM':
        return 'https://www.shikkanime.fr/assets/img/platforms/prime_video.jpg';
      default:
        return '';
    }
  }

  String _episodeType(BuildContext context) {
    switch (episode.episodeType) {
      case 'EPISODE':
        return AppLocalizations.of(context)!.episode;
      case 'SPECIAL':
        return AppLocalizations.of(context)!.special;
      case 'FILM':
        return AppLocalizations.of(context)!.film;
      default:
        return '';
    }
  }

  String _langType(BuildContext context) {
    switch (episode.langType) {
      case 'SUBTITLES':
        return AppLocalizations.of(context)!.subtitles;
      case 'VOICE':
        return AppLocalizations.of(context)!.voice;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl: episode.image,
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
                placeholder: (context, url) => Container(
                  color: Colors.grey,
                  width: double.infinity,
                  height: 200,
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: CachedNetworkImage(
                    imageUrl: _platformImage(context),
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    width: 24,
                    height: 24,
                    placeholder: (context, url) => Container(
                      color: Colors.grey,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                left: 5,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  color: Colors.black,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.play_arrow,
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        AppLocalizations.of(context)!.play,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  color: Colors.black,
                  child: Text(
                    '${Duration(seconds: episode.duration).inMinutes}m',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              episode.anime.shortName,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Text(
            AppLocalizations.of(context)!.information(
              _episodeType(context),
              episode.number,
              episode.season,
              episode.uncensored
                  ? AppLocalizations.of(context)!.uncensored
                  : '',
            ),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              _langType(context),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
