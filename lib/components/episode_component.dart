import 'dart:ui';

import 'package:application/components/card_component.dart' as card;
import 'package:application/components/lang_type_component.dart';
import 'package:application/components/platform_component.dart';
import 'package:application/dtos/episode_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:like_button/like_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vibration/vibration.dart';

const _bookmarkColor = Colors.yellow;

class EpisodeComponent extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return card.Card(
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
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      child: CachedNetworkImage(
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
                      ),
                  ],
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: PlatformComponent(platform: episode.platform),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: Row(
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
                      LangTypeComponent(langType: episode.langType),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                            color: isLiked ? _bookmarkColor : null,
                          );
                        },
                        circleColor: const CircleColor(
                          start: _bookmarkColor,
                          end: _bookmarkColor,
                        ),
                        bubblesColor: const BubblesColor(
                          dotPrimaryColor: _bookmarkColor,
                          dotSecondaryColor: _bookmarkColor,
                        ),
                        onTap: (isLiked) async {
                          if (!isLiked) {
                            // Vibration.vibrate(duration: 100);
                            Vibration.vibrate(
                                pattern: [0, 50, 125, 50, 125, 50]);

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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
