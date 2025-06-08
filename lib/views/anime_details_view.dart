import 'dart:math';

import 'package:application/components/elevated_async_button.dart';
import 'package:application/components/elevated_dropdown_button.dart';
import 'package:application/components/episodes/anime_episode_component.dart';
import 'package:application/components/image_component.dart';
import 'package:application/components/lang_type_component.dart';
import 'package:application/components/platforms/platform_component.dart';
import 'package:application/components/watchlist_button.dart';
import 'package:application/controllers/animes/anime_details_controller.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/controllers/sort_controller.dart';
import 'package:application/controllers/vibration_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/anime_platform_dto.dart';
import 'package:application/dtos/enums/image_type.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/dtos/platform_dto.dart';
import 'package:application/dtos/season_dto.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:application/utils/analytics.dart';
import 'package:application/utils/constant.dart';
import 'package:application/utils/widget_builder.dart' as wb;
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimeDetailsView extends StatefulWidget {
  const AnimeDetailsView({required this.anime, super.key});

  final AnimeDto anime;

  @override
  State<AnimeDetailsView> createState() => _AnimeDetailsViewState();
}

class _AnimeDetailsViewState extends State<AnimeDetailsView> {
  bool _showMore = false;
  final ScrollController scrollController = ScrollController();
  final Set<String> _selectedEpisodes = <String>{};

  @override
  void initState() {
    super.initState();
    AnimeDetailsController.instance.anime = widget.anime;

    if (SortController.instance.sortType == SortType.oldest) {
      AnimeDetailsController.instance.season = widget.anime.seasons?.first;
    } else {
      AnimeDetailsController.instance.season = widget.anime.seasons?.last;
    }

    WidgetsBinding.instance.addPostFrameCallback((final _) {
      AnimeDetailsController.instance.init();
    });
  }

  @override
  void dispose() {
    super.dispose();
    AnimeDetailsController.instance.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final TextSpan span = TextSpan(
      text:
          widget.anime.description ??
          AppLocalizations.of(context)!.defaultDescription,
    );

    final TextPainter textPainter = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
      maxLines: 4,
    )..layout(maxWidth: MediaQuery.sizeOf(context).width - 16);

    final List<SeasonDto>? seasons =
        SortController.instance.sortType == SortType.oldest
        ? widget.anime.seasons
        : widget.anime.seasons?.reversed.toList();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          ElevatedAsyncButton(
            onPressed: () async {
              await MemberController.instance.followAllEpisodes(
                widget.anime.uuid,
              );

              VibrationController.instance.vibrate(
                pattern: <int>[0, 50, 125, 50, 125, 50],
              );
            },
            child: Flex(
              spacing: 8,
              direction: Axis.horizontal,
              children: <Widget>[
                const Icon(Icons.checklist),
                Text(AppLocalizations.of(context)!.markWatched),
              ],
            ),
          ),
          IconButton(
            onPressed: () async {
              Analytics.instance.logShare('anime', widget.anime.uuid, 'appBar');
              await SharePlus.instance.share(
                ShareParams(
                  uri: Uri.parse(
                    '${Constant.baseUrl}/animes/${widget.anime.slug}',
                  ),
                ),
              );
            },
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: AnimeDetailsController.instance.scrollController,
        child: SafeArea(
          child: Column(
            spacing: 8,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        ImageComponent(
                          uuid: widget.anime.uuid,
                          type: ImageType.banner,
                          height: MediaQuery.sizeOf(context).width > 900
                              ? 300
                              : null,
                          fit: BoxFit.cover,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(Constant.borderRadius),
                          ),
                        ),
                        ...PlatformComponent.toPlatformsRow(
                          widget.anime.platforms,
                        ),
                      ],
                    ),
                    Row(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.anime.shortName,
                                style: Theme.of(context).textTheme.bodyLarge,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              if (widget.anime.langTypes != null)
                                for (final String langType
                                    in widget.anime.langTypes!)
                                  LangTypeComponent(langType: langType),
                            ],
                          ),
                        ),
                        Flex(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            WatchlistButton(
                              anime: widget.anime.uuid,
                              isAnime: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      spacing: 4,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(AppLocalizations.of(context)!.watchOn),
                        Scrollbar(
                          controller: scrollController,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            controller: scrollController,
                            child: Row(
                              spacing: 16,
                              children: <Widget>[
                                for (final PlatformDto platform
                                    in widget.anime.platforms)
                                  ElevatedButton(
                                    onPressed: () {
                                      final AnimePlatformDto? animePlatform =
                                          widget.anime.platformIds?.firstWhere(
                                            (final AnimePlatformDto e) =>
                                                e.platform.id == platform.id,
                                          );

                                      if (animePlatform == null) {
                                        return;
                                      }

                                      String? url;

                                      switch (platform.id) {
                                        case 'CRUN':
                                          url =
                                              'https://www.crunchyroll.com/series/${animePlatform.platformId}';
                                        case 'ANIM':
                                          url =
                                              'https://animationdigitalnetwork.com/video/${animePlatform.platformId}';
                                        case 'NETF':
                                          url =
                                              'https://www.netflix.com/title/${animePlatform.platformId}';
                                        case 'PRIM':
                                          url =
                                              'https://www.primevideo.com/detail/${animePlatform.platformId}';
                                        case 'DISN':
                                          url =
                                              'https://www.disneyplus.com/browse/entity-${animePlatform.platformId}';
                                      }

                                      if (url != null) {
                                        launchUrl(
                                          Uri.parse(url),
                                          mode: LaunchMode
                                              .externalNonBrowserApplication,
                                        );
                                      }
                                    },
                                    child: Flex(
                                      spacing: 8,
                                      mainAxisSize: MainAxisSize.min,
                                      direction: Axis.horizontal,
                                      children: <Widget>[
                                        PlatformComponent(platform: platform),
                                        Text(
                                          platform.name,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: Text.rich(
                            span,
                            overflow: _showMore
                                ? TextOverflow.visible
                                : TextOverflow.ellipsis,
                            maxLines: _showMore ? null : 4,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
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
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        if (seasons != null)
                          ElevatedDropdownButton<SeasonDto>(
                            globalKey: GlobalKey(),
                            value: AnimeDetailsController.instance.season,
                            items: <ElevatedPopupMenuItem<SeasonDto>>[
                              for (final SeasonDto season in seasons)
                                ElevatedPopupMenuItem<SeasonDto>(
                                  value: season,
                                  child: Text(
                                    AppLocalizations.of(
                                      context,
                                    )!.season(season.number.toString()),
                                  ),
                                ),
                            ],
                            onChanged: (final SeasonDto value) {
                              setState(() {
                                AnimeDetailsController.instance.season = value;
                                AnimeDetailsController.instance.init();
                              });
                            },
                          ),
                        const Spacer(),
                        ElevatedDropdownButton<SortType>(
                          globalKey: GlobalKey(),
                          value: SortController.instance.sortType,
                          items: <ElevatedPopupMenuItem<SortType>>[
                            for (final SortType sortType in SortType.values)
                              ElevatedPopupMenuItem<SortType>(
                                value: sortType,
                                child: Text(
                                  AppLocalizations.of(
                                    context,
                                  )!.sortType(sortType.name),
                                ),
                              ),
                          ],
                          onChanged: (final SortType value) {
                            setState(() {
                              SortController.instance.setSortType(value);
                              AnimeDetailsController.instance.init();
                            });
                          },
                          showIcon: false,
                          child: Flex(
                            spacing: 8,
                            direction: Axis.horizontal,
                            children: <Widget>[
                              const Icon(Icons.sort),
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
                initialData: AnimeDetailsController.instance.items,
                builder:
                    (
                      final BuildContext context,
                      final AsyncSnapshot<List<EpisodeMappingDto>> snapshot,
                    ) => Column(
                      children: _buildEpisodeList(context, snapshot.data!),
                    ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _selectedEpisodes.isNotEmpty
          ? FloatingActionButton(
              onPressed: () async {
                for (final String uuid in _selectedEpisodes) {
                  await MemberController.instance.followEpisode(
                    widget.anime.uuid,
                    AnimeDetailsController.instance.items
                        .firstWhere(
                          (final EpisodeMappingDto episode) =>
                              episode.uuid == uuid,
                        )
                        .uuid,
                    refreshAfterFollow: false,
                  );
                }

                await MemberController.instance.refresh();

                VibrationController.instance.vibrate(
                  pattern: <int>[0, 50, 125, 50, 125, 50],
                );

                setState(_selectedEpisodes.clear);
              },
              tooltip: AppLocalizations.of(context)!.markAsWatched,
              child: const Icon(Icons.bookmarks),
            )
          : null,
    );
  }

  List<Widget> _buildEpisodeList(
    final BuildContext context,
    final List<EpisodeMappingDto> episodes,
  ) => wb.WidgetBuilder.instance.buildRowWidgets(
    episodes.map(
      (final EpisodeMappingDto episode) => AnimeEpisodeComponent(
        episode: episode,
        onDoubleAndLongPress: () {
          setState(() {
            if (_selectedEpisodes.contains(episode.uuid)) {
              _selectedEpisodes.remove(episode.uuid);
            } else {
              _selectedEpisodes.add(episode.uuid);
            }
          });
        },
        isSelected: _selectedEpisodes.contains(episode.uuid),
      ),
    ),
    maxElementsPerRow: max(
      1,
      (MediaQuery.sizeOf(context).width * 2 / 900).floor(),
    ),
  );
}
