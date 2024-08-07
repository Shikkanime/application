import 'package:application/components/elevated_dropdown_button.dart';
import 'package:application/components/episodes/anime_episode_component.dart';
import 'package:application/components/watchlist_button.dart';
import 'package:application/components/image_component.dart';
import 'package:application/components/lang_type_component.dart';
import 'package:application/controllers/anime_details_controller.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/controllers/missed_anime_controller.dart';
import 'package:application/controllers/sort_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/dtos/season_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vibration/vibration.dart';

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

    if (SortController.instance.sortType == SortType.oldest) {
      AnimeDetailsController.instance.season = widget.anime.seasons?.first;
    } else {
      AnimeDetailsController.instance.season = widget.anime.seasons?.last;
    }

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
              if (value == 0) {
                MemberController.instance
                    .followAllEpisodes(widget.anime)
                    .then((value) => MissedAnimeController.instance.init());
                Vibration.vibrate(pattern: [0, 50, 125, 50, 125, 50]);
              } else if (value == 1) {
                Share.share(
                  '${Constant.baseUrl}/animes/${widget.anime.slug}',
                );
              }
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
                ImageComponent(
                  uuid: widget.anime.uuid,
                  height: 550,
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
                      WatchlistButton(anime: widget.anime),
                    ],
                  ),
                  if (widget.anime.langTypes != null)
                    for (final langType in widget.anime.langTypes!)
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
                      const Spacer(),
                      if (textPainter.didExceedMaxLines)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _showMore = !_showMore;
                            });
                          },
                          child: Text(
                            _showMore
                                ? AppLocalizations.of(context)!.showLess
                                : AppLocalizations.of(context)!.showMore,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      const Spacer(),
                    ],
                  ),
                  Row(
                    children: [
                      if (widget.anime.seasons != null)
                        ElevatedDropdownButton<SeasonDto>(
                          globalKey: GlobalKey(),
                          value: AnimeDetailsController.instance.season,
                          items: [
                            for (final season in widget.anime.seasons!)
                              ElevatedPopupMenuItem(
                                value: season,
                                child: Text(
                                  AppLocalizations.of(context)!.season(
                                    season.number,
                                  ),
                                ),
                              ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              AnimeDetailsController.instance.season = value;
                              AnimeDetailsController.instance.refresh();
                            });
                          },
                        ),
                      const Spacer(),
                      ElevatedDropdownButton(
                        globalKey: GlobalKey(),
                        value: SortController.instance.sortType,
                        items: [
                          for (final sortType in SortType.values)
                            ElevatedPopupMenuItem(
                              value: sortType,
                              child: Text(
                                AppLocalizations.of(context)!
                                    .sortType(sortType.name),
                              ),
                              leading:
                                  SortController.instance.sortType == sortType
                                      ? const Icon(Icons.check)
                                      : null,
                            ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            SortController.instance.setSortType(value);
                            AnimeDetailsController.instance.refresh();
                          });
                        },
                        showIcon: false,
                        child: Flex(
                          direction: Axis.horizontal,
                          children: [
                            const Icon(Icons.sort),
                            const SizedBox(width: 8),
                            Text(AppLocalizations.of(context)!.sort),
                          ],
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
