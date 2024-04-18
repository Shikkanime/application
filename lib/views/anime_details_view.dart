import 'package:application/components/anime_episode_component.dart';
import 'package:application/components/episodes/watchlist_button.dart';
import 'package:application/components/lang_type_component.dart';
import 'package:application/controllers/anime_details_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AnimeDetailsView extends StatefulWidget {
  final AnimeDto anime;

  const AnimeDetailsView({super.key, required this.anime});

  @override
  State<AnimeDetailsView> createState() => _AnimeDetailsViewState();
}

class _AnimeDetailsViewState extends State<AnimeDetailsView> {
  bool _showMore = false;

  @override
  void initState() {
    super.initState();
    AnimeDetailsController.instance.anime = widget.anime;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      AnimeDetailsController.instance.init();
    });
  }

  @override
  void dispose() {
    super.dispose();
    AnimeDetailsController.instance.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final span = TextSpan(
      text: widget.anime.description ?? '',
      style:
          Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
    );

    final textPainter = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
      maxLines: 4,
    )..layout(maxWidth: MediaQuery.of(context).size.width - 16);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 0,
                  child: Text(AppLocalizations.of(context)!.markWatched),
                ),
                PopupMenuItem(
                  value: 1,
                  child: Text(AppLocalizations.of(context)!.share),
                ),
              ];
            },
            onSelected: (int value) {
              // Not implemented
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: AnimeDetailsController.instance.scrollController,
        child: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      '${Constant.apiUrl}/v1/attachments?uuid=${widget.anime.uuid}&type=image',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 550,
                  placeholder: (context, url) => Container(
                    color: Colors.grey,
                    width: double.infinity,
                    height: 550,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 551,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black,
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0),
                          Colors.black,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.anime.shortName,
                          style: Theme.of(context).textTheme.bodyLarge,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      const WatchlistButton(),
                    ],
                  ),
                  for (final langType in widget.anime.langTypes)
                    LangTypeComponent(langType: langType),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text.rich(
                      span,
                      overflow: _showMore
                          ? TextOverflow.visible
                          : TextOverflow.ellipsis,
                      maxLines: _showMore ? null : 4,
                    ),
                  ),
                  Row(
                    children: [
                      // Sort
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(height: 8),
                                  Text(
                                    AppLocalizations.of(context)!.sortBy,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  ListTile(
                                    title: Text(
                                      AppLocalizations.of(context)!.oldest,
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);

                                      setState(() {
                                        AnimeDetailsController.instance.sort =
                                            Sort.oldest;
                                        AnimeDetailsController.instance
                                            .refresh();
                                      });
                                    },
                                    leading:
                                        AnimeDetailsController.instance.sort ==
                                                Sort.oldest
                                            ? const Icon(Icons.check)
                                            : null,
                                  ),
                                  ListTile(
                                    title: Text(
                                      AppLocalizations.of(context)!.newest,
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);

                                      setState(() {
                                        AnimeDetailsController.instance.sort =
                                            Sort.newest;
                                        AnimeDetailsController.instance
                                            .refresh();
                                      });
                                    },
                                    leading:
                                        AnimeDetailsController.instance.sort ==
                                                Sort.newest
                                            ? const Icon(Icons.check)
                                            : null,
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Flex(
                          direction: Axis.horizontal,
                          children: [
                            const Icon(Icons.sort),
                            const SizedBox(width: 8),
                            Text(AppLocalizations.of(context)!.sort),
                          ],
                        ),
                      ),
                      const Spacer(),
                      if (textPainter.didExceedMaxLines)
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _showMore = !_showMore;
                            });
                          },
                          child: Text(
                            _showMore
                                ? AppLocalizations.of(context)!.showLess
                                : AppLocalizations.of(context)!.showMore,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            StreamBuilder<List<EpisodeMappingDto>>(
              stream: AnimeDetailsController.instance.streamController.stream,
              initialData: AnimeDetailsController.instance.episodes,
              builder: (context, snapshot) {
                return Column(
                  children: [
                    for (final episode in snapshot.data!)
                      AnimeEpisodeComponent(episode: episode),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
