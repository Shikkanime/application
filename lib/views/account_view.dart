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
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                Icons.edit,
                                size: 15,
                                color: Colors.grey,
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
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          child: const Icon(
                            Icons.info,
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
                      value: member?.followedAnimes.length.toString() ?? '0',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: AccountCard(
                      label: appLocalizations.episodesWatched,
                      value: member?.followedEpisodes.length.toString() ?? '0',
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
                      value: MemberController.instance.buildTotalDuration(),
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
                beautifyDate(context, member?.creationDateTime ?? ''),
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

  String beautifyDate(BuildContext context, String date) {
    return DateFormat(
      'EEEE dd MMM yyyy',
      Localizations.localeOf(context).languageCode,
    ).format(DateTime.parse(date));
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
            initialData: FollowedAnimeController.instance.animes,
            builder: (context, snapshot) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(AppLocalizations.of(context)!
                          .yourRecentlyAddedAnime1),
                      Text(
                        AppLocalizations.of(context)!.yourRecentlyAddedAnime2,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      if (snapshot.data!.isNotEmpty) ...[
                        const Spacer(),
                        const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const FollowedAnimesView(),
                              ),
                            );
                          },
                          child: Text(
                            AppLocalizations.of(context)!.showMore,
                            style: const TextStyle(color: Colors.white),
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
                            const Icon(
                              Icons.sentiment_very_dissatisfied,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context)!.noFollowedAnime,
                                style: Theme.of(context).textTheme.titleSmall,
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
                                height: 180,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  addAutomaticKeepAlives: false,
                                  addRepaintBoundaries: false,
                                  shrinkWrap: true,
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
              );
            },
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
            initialData: FollowedEpisodeController.instance.episodes,
            builder: (context, snapshot) {
              return Column(
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
                            const Icon(
                              Icons.add,
                              color: Colors.white,
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
                                style: const TextStyle(color: Colors.white),
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
                            const Icon(
                              Icons.sentiment_very_dissatisfied,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              AppLocalizations.of(context)!.noWatchedEpisode,
                              style: Theme.of(context).textTheme.titleSmall,
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
                                  shrinkWrap: true,
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
              );
            },
          ),
        ),
      ),
    );
  }
}
