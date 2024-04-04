import 'dart:ui';

import 'package:application/components/blur.dart';
import 'package:application/dtos/episode_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:like_button/like_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vibration/vibration.dart';

const _bookmarkColor = Colors.yellow;

class EpisodeComponent extends StatefulWidget {
  final EpisodeDto episode;

  const EpisodeComponent({
    super.key,
    required this.episode,
  });

  @override
  State<EpisodeComponent> createState() => _MyEpisodeComponentState();
}

class _MyEpisodeComponentState extends State<EpisodeComponent>
    with TickerProviderStateMixin {
  bool _longPress = false;

  String _episodeType(BuildContext context) {
    switch (widget.episode.episodeType) {
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
    switch (widget.episode.langType) {
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
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: GestureDetector(
          onLongPress: () {
            setState(() {
              _longPress = !_longPress;
            });
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.surface,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: Blur(
                blur: _longPress ? 5 : 0,
                blurColor: Colors.black,
                colorOpacity: _longPress ? 0.5 : 0,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                overlay: !_longPress
                    ? null
                    : FadeTransition(
                        opacity: Tween<double>(begin: 0, end: 1).animate(
                          CurvedAnimation(
                            parent: AnimationController(
                              vsync: this,
                              duration: const Duration(milliseconds: 500),
                            )..forward(),
                            curve: Curves.easeInOut,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                widget.episode.title!,
                                style: Theme.of(context).textTheme.bodyLarge,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(height: 8),
                              Flex(
                                direction: Axis.horizontal,
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.calendar_today,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    DateFormat('dd/MM/yyyy').format(
                                        DateTime.parse(
                                            widget.episode.releaseDateTime)),
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                widget.episode.description ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(height: 16),
                              GestureDetector(
                                onTap: () {
                                  launchUrl(
                                    Uri.parse(widget.episode.url),
                                    mode: LaunchMode
                                        .externalNonBrowserApplication,
                                  );
                                },
                                child: Flex(
                                  direction: Axis.horizontal,
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.live_tv_outlined,
                                      color: Colors.yellow,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      AppLocalizations.of(context)!.watchNow,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: Colors.yellow,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
                                      '${Constant.apiUrl}/v1/attachments?uuid=${widget.episode.uuid}&type=image',
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  placeholder: (context, url) => Container(
                                    color: Colors.grey,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                              if (widget.episode.uncensored)
                                ClipRRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10, sigmaY: 10),
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(32),
                            child: CachedNetworkImage(
                              imageUrl:
                                  '${Constant.baseUrl}/assets/img/platforms/${widget.episode.platform.image}',
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
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  widget.episode.anime.shortName,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.information(
                                    _episodeType(context),
                                    widget.episode.number,
                                    widget.episode.season,
                                    widget.episode.uncensored
                                        ? AppLocalizations.of(context)!
                                            .uncensored
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
                                  Uri.parse(widget.episode.url),
                                  mode:
                                      LaunchMode.externalNonBrowserApplication,
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
                                isLiked
                                    ? Icons.bookmark
                                    : Icons.bookmark_border,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
