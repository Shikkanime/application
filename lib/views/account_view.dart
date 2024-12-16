import 'dart:math';

import 'package:application/components/account_card.dart';
import 'package:application/components/animes/followed_anime_component.dart';
import 'package:application/components/card_component.dart';
import 'package:application/components/episodes/followed_episode_component.dart';
import 'package:application/components/member_image.dart';
import 'package:application/controllers/followed_anime_controller.dart';
import 'package:application/controllers/followed_episode_controller.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/dtos/member_dto.dart';
import 'package:application/views/associate_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  String buildTotalDuration(
    final BuildContext context,
    final int totalDuration,
  ) {
    final Duration duration = Duration(seconds: totalDuration);
    // Build string like '1d 2h 3m 4s'
    // If a value is 0, it is not included
    final List<String> parts = <String>[];

    if (duration.inDays > 0) {
      parts.add('${duration.inDays}${AppLocalizations.of(context)!.days}');
    }

    if (duration.inHours > 0) {
      parts.add('${duration.inHours % 24}h');
    }

    if (duration.inMinutes > 0) {
      parts.add('${duration.inMinutes % 60}m');
    }

    parts.add('${duration.inSeconds % 60}s');
    return parts.join(' ');
  }

  @override
  Widget build(final BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
          child: StreamBuilder<MemberDto>(
            stream: MemberController.instance.streamController.stream,
            initialData: MemberController.instance.member,
            builder: (
              final BuildContext context,
              final AsyncSnapshot<MemberDto> snapshot,
            ) {
              final MemberDto? member = snapshot.data;

              return Column(
                spacing: 16,
                children: <Widget>[
                  Row(
                    spacing: 16,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          MemberController.instance.changeImage(context);
                        },
                        child: Stack(
                          children: <Widget>[
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: MemberImage(member: member),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .color,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Icon(
                                    Icons.edit,
                                    size: 15,
                                    color: Theme.of(context).canvasColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Flex(
                              spacing: 8,
                              direction: Axis.horizontal,
                              children: <Widget>[
                                Text(
                                  appLocalizations!.anonymousAccount,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .color,
                                  ),
                                ),
                                GestureDetector(
                                  child: const Icon(
                                    Icons.info_outline,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (final BuildContext context) =>
                                          AlertDialog(
                                        title: Text(
                                          appLocalizations
                                              .anonymousWarningTitle,
                                        ),
                                        content: SingleChildScrollView(
                                          child: Column(
                                            spacing: 16,
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                appLocalizations
                                                    .anonymousWarningContent1,
                                              ),
                                              Text(
                                                appLocalizations
                                                    .anonymousWarningContent2,
                                              ),
                                              Text(
                                                appLocalizations
                                                    .anonymousWarningContent3,
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(appLocalizations.ok),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            Text(
                              appLocalizations.accountCreatedAt(
                                DateFormat(
                                  AppLocalizations.of(context)!
                                      .accountDateFormat,
                                  WidgetsBinding
                                      .instance.platformDispatcher.locale
                                      .toString(),
                                ).format(
                                  DateTime.parse(
                                    member?.creationDateTime ?? '',
                                  ),
                                ),
                              ),
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                              maxLines: 2,
                            ),
                            if (member?.email == null) ...<Widget>[
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute<void>(
                                      builder: (final BuildContext context) =>
                                          const AssociateEmail(),
                                    ),
                                  );
                                },
                                child: Text(appLocalizations.associateEmail),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 16,
                    children: <Widget>[
                      Expanded(
                        child: AccountCard(
                          label: appLocalizations.animesAdded,
                          value: NumberFormat.decimalPattern()
                              .format(member?.followedAnimes.length ?? 0),
                        ),
                      ),
                      Expanded(
                        child: AccountCard(
                          label: appLocalizations.episodesWatched,
                          // 2376 -> 2 376
                          value: NumberFormat.decimalPattern()
                              .format(member?.followedEpisodes.length ?? 0),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: AccountCard(
                          label: appLocalizations.watchTime,
                          value: buildTotalDuration(
                            context,
                            member?.totalDuration ?? 0,
                          ),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: LinearProgressIndicator(
                                value: (member?.totalDuration ?? 0) /
                                    max(
                                      1,
                                      ((member?.totalDuration ?? 0) +
                                              (member?.totalUnseenDuration ??
                                                  0))
                                          .toDouble(),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const FollowedAnimesRow(),
                  const FollowedEpisodesRow(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class FollowedAnimesRow extends StatelessWidget {
  const FollowedAnimesRow({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => CustomCard(
        padding: false,
        margin: 12,
        child: Scrollbar(
          controller: FollowedAnimeController.instance.scrollController,
          child: StreamBuilder<List<AnimeDto>>(
            stream: FollowedAnimeController.instance.streamController.stream,
            initialData: FollowedAnimeController.instance.items,
            builder: (
              final BuildContext context,
              final AsyncSnapshot<List<AnimeDto>> snapshot,
            ) =>
                Column(
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Text(AppLocalizations.of(context)!.yourRecentlyAddedAnime1),
                    Text(
                      AppLocalizations.of(context)!.yourRecentlyAddedAnime2,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                if (snapshot.data!.isEmpty)
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            AppLocalizations.of(context)!.noFollowedAnime,
                            style: Theme.of(context).textTheme.titleSmall,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: 182,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            addAutomaticKeepAlives: false,
                            addRepaintBoundaries: false,
                            itemCount: snapshot.data!.length,
                            controller: FollowedAnimeController
                                .instance.scrollController,
                            itemBuilder: (
                              final BuildContext context,
                              final int index,
                            ) =>
                                FollowedAnimeComponent(
                              anime: snapshot.data![index],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      );
}

class FollowedEpisodesRow extends StatelessWidget {
  const FollowedEpisodesRow({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => CustomCard(
        padding: false,
        margin: 12,
        child: Scrollbar(
          controller: FollowedEpisodeController.instance.scrollController,
          child: StreamBuilder<List<EpisodeMappingDto>>(
            stream: FollowedEpisodeController.instance.streamController.stream,
            initialData: FollowedEpisodeController.instance.items,
            builder: (
              final BuildContext context,
              final AsyncSnapshot<List<EpisodeMappingDto>> snapshot,
            ) =>
                Column(
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context)!.yourRecentlyViewedEpisodes1,
                    ),
                    Text(
                      AppLocalizations.of(context)!.yourRecentlyViewedEpisodes2,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                if (snapshot.data!.isEmpty)
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            AppLocalizations.of(context)!.noWatchedEpisode,
                            style: Theme.of(context).textTheme.titleSmall,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: 125,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            addAutomaticKeepAlives: false,
                            addRepaintBoundaries: false,
                            itemCount: snapshot.data!.length,
                            controller: FollowedEpisodeController
                                .instance.scrollController,
                            itemBuilder: (
                              final BuildContext context,
                              final int index,
                            ) =>
                                FollowedEpisodeComponent(
                              episode: snapshot.data![index],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      );
}
