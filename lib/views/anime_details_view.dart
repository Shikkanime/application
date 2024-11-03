import 'dart:math';

import 'package:application/components/elevated_dropdown_button.dart';
import 'package:application/components/episodes/anime_episode_component.dart';
import 'package:application/components/image_component.dart';
import 'package:application/components/lang_type_component.dart';
import 'package:application/components/watchlist_button.dart';
import 'package:application/controllers/anime_details_controller.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/controllers/sort_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/dtos/season_dto.dart';
import 'package:application/utils/analytics.dart';
import 'package:application/utils/constant.dart';
import 'package:application/utils/widget_builder.dart' as wb;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vibration/vibration.dart';

class AnimeDetailsView extends StatefulWidget {
  const AnimeDetailsView({required this.anime, super.key});

  final AnimeDto anime;

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
      text: widget.anime.description ?? '',
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: Theme.of(context).textTheme.titleLarge!.color),
    );

    final TextPainter textPainter = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
      maxLines: 4,
    )..layout(maxWidth: MediaQuery.sizeOf(context).width - 16);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          PopupMenuButton<int>(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (final BuildContext context) => <PopupMenuItem<int>>[
              PopupMenuItem<int>(
                value: 0,
                child: Text(AppLocalizations.of(context)!.markWatched),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Text(AppLocalizations.of(context)!.share),
              ),
            ],
            onSelected: (final int value) {
              if (value == 0) {
                Vibration.vibrate(pattern: <int>[0, 50, 125, 50, 125, 50]);
                MemberController.instance.followAllEpisodes(widget.anime);
              } else if (value == 1) {
                Analytics.instance
                    .logShare('anime', widget.anime.uuid, 'appBar');

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
          children: <Widget>[
            Stack(
              children: <Widget>[
                ImageComponent(
                  uuid: widget.anime.uuid,
                  fit: BoxFit.cover,
                  height: MediaQuery.sizeOf(context).height * 0.7,
                ),
                SizedBox(
                  width: double.infinity,
                  height: (MediaQuery.sizeOf(context).height * 0.7) + 1,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Theme.of(context).scaffoldBackgroundColor,
                          Theme.of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(0),
                          Theme.of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(0),
                          Theme.of(context).scaffoldBackgroundColor,
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
                children: <Widget>[
                  Text(
                    widget.anime.shortName,
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  if (widget.anime.langTypes != null)
                    for (final String langType in widget.anime.langTypes!)
                      LangTypeComponent(langType: langType),
                  const SizedBox(height: 8),
                  Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      WatchlistButton(anime: widget.anime),
                    ],
                  ),
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
                    children: <Widget>[
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
                    children: <Widget>[
                      if (widget.anime.seasons != null)
                        ElevatedDropdownButton<SeasonDto>(
                          globalKey: GlobalKey(),
                          value: AnimeDetailsController.instance.season,
                          items: <ElevatedPopupMenuItem<SeasonDto>>[
                            for (final SeasonDto season
                                in widget.anime.seasons!)
                              ElevatedPopupMenuItem<SeasonDto>(
                                value: season,
                                child: Text(
                                  AppLocalizations.of(context)!.season(
                                    season.number,
                                  ),
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
                                AppLocalizations.of(context)!
                                    .sortType(sortType.name),
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
                          direction: Axis.horizontal,
                          children: <Widget>[
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
              initialData: AnimeDetailsController.instance.items,
              builder: (
                final BuildContext context,
                final AsyncSnapshot<List<EpisodeMappingDto>> snapshot,
              ) {
                final List<Widget> list =
                    _buildEpisodeList(context, snapshot.data!);
                return Column(children: list);
              },
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildEpisodeList(
    final BuildContext context,
    final List<EpisodeMappingDto> episodes,
  ) {
    final double smallestDimension = MediaQuery.sizeOf(context).width;

    return wb.WidgetBuilder.instance.buildRowWidgets(
      episodes.map(
        (final EpisodeMappingDto episode) =>
            AnimeEpisodeComponent(episode: episode),
      ),
      maxElementsPerRow: max(1, (smallestDimension * 2 / 900).floor()),
    );
  }
}
