import 'dart:math';

import 'package:application/components/account_card.dart';
import 'package:application/components/animes/followed_anime_component.dart';
import 'package:application/components/card_component.dart';
import 'package:application/components/episodes/followed_episode_component.dart';
import 'package:application/controllers/followed_anime_controller.dart';
import 'package:application/controllers/followed_episode_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/views/associate_email.dart';
import 'package:application/components/member_image.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/member_dto.dart';
import 'package:application/views/followed_animes_view.dart';
import 'package:application/views/followed_episodes_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  String buildTotalDuration(BuildContext context, int totalDuration) {
    final duration = Duration(seconds: totalDuration);
    // Build string like '1d 2h 3m 4s'
    // If a value is 0, it is not included
    final parts = <String>[];

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
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return StreamBuilder<MemberDto>(
      stream: MemberController.instance.streamController.stream,
      initialData: MemberController.instance.member,
      builder: (context, snapshot) {
        final member = snapshot.data;

        return ListView(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: MemberImage(member: member),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            MemberController.instance.changeImage(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .color!,
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
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Text(
                          appLocalizations!.anonymousAccount,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).textTheme.titleLarge!.color!,
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          child: const Icon(
                            Icons.info_outline,
                            color: Colors.grey,
                            size: 20,
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    appLocalizations.anonymousWarningTitle,
                                  ),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Text(appLocalizations
                                            .anonymousWarningContent1),
                                        const SizedBox(height: 16),
                                        Text(appLocalizations
                                            .anonymousWarningContent2),
                                        const SizedBox(height: 16),
                                        Text(appLocalizations
                                            .anonymousWarningContent3),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(appLocalizations.ok),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    Text(
                      appLocalizations.member,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    if (member?.email == null) ...[
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const AssociateEmail(),
                            ),
                          );
                        },
                        child: Text(appLocalizations.associateEmail),
                      ),
                    ],
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: AccountCard(
                      label: appLocalizations.animesAdded,
                      value: NumberFormat.decimalPattern()
                          .format(member?.followedAnimes.length ?? 0),
                    ),
                  ),
                  const SizedBox(width: 16),
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
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: AccountCard(
                      label: appLocalizations.watchTime,
                      value: buildTotalDuration(
                          context, member?.totalDuration ?? 0),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: LinearProgressIndicator(
                            value: (member?.totalDuration ?? 0) /
                                max(
                                  1,
                                  ((member?.totalDuration ?? 0) +
                                          (member?.totalUnseenDuration ?? 0))
                                      .toDouble(),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const FollowedAnimesRow(),
            const FollowedEpisodesRow(),
            const SizedBox(height: 16),
            Text(
              appLocalizations.accountCreatedAt(
                DateFormat(
                  AppLocalizations.of(context)!.accountDateFormat,
                  WidgetsBinding.instance.platformDispatcher.locale.toString(),
                ).format(DateTime.parse(member?.creationDateTime ?? '')),
              ),
              style: const TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}

class FollowedAnimesRow extends StatelessWidget {
  const FollowedAnimesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: CustomCard(
        horizontalPadding: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          child: StreamBuilder<List<AnimeDto>>(
            stream: FollowedAnimeController.instance.streamController.stream,
            initialData: FollowedAnimeController.instance.items,
            builder: (context, snapshot) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(AppLocalizations.of(context)!.yourRecentlyAddedAnime1),
                    Text(
                      AppLocalizations.of(context)!.yourRecentlyAddedAnime2,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (snapshot.data!.isNotEmpty) ...[
                      const Spacer(),
                      Icon(
                        Icons.add,
                        color: Theme.of(context).textTheme.titleLarge!.color!,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const FollowedAnimesView(),
                            ),
                          );
                        },
                        child: Text(
                          AppLocalizations.of(context)!.showMore,
                          style: TextStyle(
                            color:
                                Theme.of(context).textTheme.titleLarge!.color!,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 8),
                snapshot.data!.isEmpty
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context)!.noFollowedAnime,
                              style: Theme.of(context).textTheme.titleSmall,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 182,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                addAutomaticKeepAlives: false,
                                addRepaintBoundaries: false,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) =>
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
      ),
    );
  }
}

class FollowedEpisodesRow extends StatelessWidget {
  const FollowedEpisodesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 16, right: 16),
      child: CustomCard(
        horizontalPadding: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          child: StreamBuilder<List<EpisodeMappingDto>>(
            stream: FollowedEpisodeController.instance.streamController.stream,
            initialData: FollowedEpisodeController.instance.items,
            builder: (context, snapshot) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Text(AppLocalizations.of(context)!
                            .yourRecentlyViewedEpisodes1),
                        Text(
                          AppLocalizations.of(context)!
                              .yourRecentlyViewedEpisodes2,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    if (snapshot.data!.isNotEmpty) ...[
                      const Spacer(),
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Icon(
                            Icons.add,
                            color:
                                Theme.of(context).textTheme.titleLarge!.color!,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const FollowedEpisodesView(),
                                ),
                              );
                            },
                            child: Text(
                              AppLocalizations.of(context)!.showMore,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .color!,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 8),
                snapshot.data!.isEmpty
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context)!.noWatchedEpisode,
                              style: Theme.of(context).textTheme.titleSmall,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 135,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                addAutomaticKeepAlives: false,
                                addRepaintBoundaries: false,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) =>
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
      ),
    );
  }
}
