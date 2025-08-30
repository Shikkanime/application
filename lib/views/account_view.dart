import 'dart:math';

import 'package:application/components/animes/followed_animes_row.dart';
import 'package:application/components/card_component.dart';
import 'package:application/components/episodes/followed_episodes_row.dart';
import 'package:application/components/member_image.dart';
import 'package:application/components/pill.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/member_dto.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:application/utils/extensions.dart';
import 'package:application/views/associate_email.dart';
import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.only(top: 4, left: 8, right: 8, bottom: 8),
          child: StreamBuilder<MemberDto>(
            stream: MemberController.instance.streamController.stream,
            initialData: MemberController.instance.member,
            builder: (final BuildContext context, final AsyncSnapshot<MemberDto> snapshot) {
              final MemberDto? member = snapshot.data;

              return Column(
                spacing: 8,
                children: <Widget>[
                  CustomCard(
                    padding: false,
                    child: Row(
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
                                    color: Theme.of(
                                      context,
                                    ).textTheme.titleLarge!.color,
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
                                      color: Theme.of(
                                        context,
                                      ).textTheme.titleLarge!.color,
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
                                                  mainAxisSize:
                                                      MainAxisSize.min,
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
                                                  child: Text(
                                                    appLocalizations.ok,
                                                  ),
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
                                    AppLocalizations.of(
                                      context,
                                    )!.accountDateFormat,
                                    WidgetsBinding
                                        .instance
                                        .platformDispatcher
                                        .locale
                                        .toString(),
                                  ).format(
                                    DateTime.parse(
                                      member?.creationDateTime ?? '',
                                    ),
                                  ),
                                ),
                                style: const TextStyle(fontSize: 14),
                                maxLines: 2,
                              ),
                              if (member?.email == null)
                                Stack(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 8,
                                        right: 8,
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute<void>(
                                              builder:
                                                  (
                                                    final BuildContext context,
                                                  ) => const AssociateEmail(),
                                            ),
                                          );
                                        },
                                        style: Theme.of(
                                          context,
                                        ).cardButtonStyle,
                                        child: Text(
                                          appLocalizations.associateEmail,
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Pill(text: '! '),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    spacing: 8,
                    children: <Widget>[
                      Expanded(
                        child: CustomCard(
                          padding: false,
                          child: Column(
                            children: <Widget>[
                              Text(
                                NumberFormat.decimalPattern().format(
                                  member?.followedAnimes.length ?? 0,
                                ),
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).textTheme.titleLarge!.color,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                appLocalizations.animesAdded,
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).textTheme.titleLarge!.color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: CustomCard(
                          padding: false,
                          child: Column(
                            children: <Widget>[
                              Text(
                                NumberFormat.decimalPattern().format(
                                  member?.followedEpisodes.length ?? 0,
                                ),
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).textTheme.titleLarge!.color,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                appLocalizations.episodesWatched,
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).textTheme.titleLarge!.color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: CustomCard(
                          padding: false,
                          child: Column(
                            children: <Widget>[
                              Text(
                                buildTotalDuration(
                                  context,
                                  member?.totalDuration ?? 0,
                                ),
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).textTheme.titleLarge!.color,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                appLocalizations.watchTime,
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).textTheme.titleLarge!.color,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 8,
                                  left: 16,
                                  right: 16,
                                ),
                                child: LinearProgressIndicator(
                                  value:
                                      (member?.totalDuration ?? 0) /
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
