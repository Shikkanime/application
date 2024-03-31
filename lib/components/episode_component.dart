import 'dart:ui';

import 'package:application/dtos/episode_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:like_button/like_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vibration/vibration.dart';

class EpisodeComponent extends StatelessWidget {
  static const bookmarkColor = Colors.yellow;
  final EpisodeDto episode;

  const EpisodeComponent({
    super.key,
    required this.episode,
  });

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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                SizedBox(
                  height: 200,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            '${Constant.apiUrl}/v1/attachments?uuid=${episode.uuid}&type=image',
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        placeholder: (context, url) => Container(
                          color: Colors.grey,
                          width: double.infinity,
                        ),
                      ),
                      if (episode.uncensored)
                        ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              color: Colors.grey.withOpacity(0.1),
                              alignment: Alignment.center,
                            ),
                          ),
                        )
                    ],
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: CachedNetworkImage(
                      imageUrl:
                          '${Constant.baseUrl}/assets/img/platforms/${episode.platform.image}',
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
              ],
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        episode.anime.shortName,
                        style: Theme.of(context).textTheme.bodyLarge,
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
                      Text(
                        _langType(context),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                    onTap: () {
                      launchUrl(
                        Uri.parse(episode.url),
                        mode: LaunchMode.externalNonBrowserApplication,
                      );
                    },
                    child: const Icon(
                      Icons.live_tv_outlined,
                    ),
                  ),
                ),
                LikeButton(
                  likeBuilder: (isLiked) {
                    return Icon(
                      isLiked ? Icons.bookmark : Icons.bookmark_border,
                      color: isLiked ? bookmarkColor : null,
                    );
                  },
                  circleColor: const CircleColor(
                    start: bookmarkColor,
                    end: bookmarkColor,
                  ),
                  bubblesColor: const BubblesColor(
                    dotPrimaryColor: bookmarkColor,
                    dotSecondaryColor: bookmarkColor,
                  ),
                  onTap: (isLiked) async {
                    if (!isLiked) {
                      // Vibration.vibrate(duration: 100);
                      Vibration.vibrate(pattern: [0, 50, 125, 50, 125, 50]);

                      // Create snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.bookmark),
                              SizedBox(width: 8),
                              Text('Bookmarked'),
                            ],
                          ),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }

                    return !isLiked;
                  },
                )
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
