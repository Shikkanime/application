import 'package:application/components/card_component.dart';
import 'package:application/components/episodes/episode_duration.dart';
import 'package:application/components/image_component.dart';
import 'package:application/components/lang_type_component.dart';
import 'package:application/components/platforms/platform_component.dart';
import 'package:application/components/watch_button.dart';
import 'package:application/components/watchlist_button.dart';
import 'package:application/controllers/anime_controller.dart';
import 'package:application/controllers/anime_weekly_controller.dart';
import 'package:application/dtos/week_day_release_dto.dart';
import 'package:application/utils/analytics.dart';
import 'package:application/utils/constant.dart';
import 'package:application/utils/extensions.dart';
import 'package:application/views/anime_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class CalendarAnimeComponent extends StatelessWidget {
  const CalendarAnimeComponent({
    required this.release,
    super.key,
  });

  final WeekDayReleaseDto release;

  String _releaseHour(
    final BuildContext context,
    final String releaseDateTime,
  ) {
    final DateTime parsed = DateFormat('yyyy-MM-ddTHH:mm:ssZ')
        .parse(releaseDateTime, true)
        .toLocal();

    return DateFormat(AppLocalizations.of(context)!.calendarTimeFormat)
        .format(parsed);
  }

  @override
  Widget build(final BuildContext context) {
    final bool isReleased =
        release.mappings != null && release.mappings!.isNotEmpty;
    final bool isMultipleReleased = isReleased && release.mappings!.length > 1;

    return CustomCard(
      onTap: () {
        Analytics.instance.logSelectContent('anime', release.anime.uuid);

        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (final BuildContext context) =>
                AnimeDetailsView(anime: release.anime),
          ),
        );
      },
      onLongPress: (final TapDownDetails? details) {
        AnimeController.instance.onLongPress(context, release.anime, details);
      },
      child: Column(
        spacing: 8,
        children: <Widget>[
          Stack(
            children: <Widget>[
              ImageComponent(
                fit: BoxFit.cover,
                uuid: isReleased
                    ? release.mappings!.first.uuid
                    : release.anime.uuid,
                version: (isReleased
                        ? release.mappings!.first.lastUpdateDateTime
                        : release.anime.lastUpdateDateTime)
                    .toDateTime()
                    ?.millisecondsSinceEpoch
                    .toString(),
                type: isReleased ? 'image' : 'banner',
                borderRadius: const BorderRadius.all(
                  Radius.circular(Constant.borderRadius),
                ),
                height: 185,
              ),
              ...PlatformComponent.toPlatformsRow(release.platforms),
              if (isReleased && !isMultipleReleased)
                Positioned(
                  bottom: Constant.cornerPadding,
                  right: Constant.cornerPadding,
                  child: EpisodeDuration(
                    episode: release.mappings!.first,
                    cornerPadding: Constant.cornerPadding,
                  ),
                ),
            ],
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  _releaseHour(context, release.releaseDateTime),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: VerticalDivider(
                    color: Theme.of(context).dividerColor,
                    thickness: 0.5,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        release.anime.shortName,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      if (isReleased)
                        Text(
                          AppLocalizations.of(context)!.minInformation(
                            AppLocalizations.of(context)!.episodeType(
                              release.episodeType!.toLowerCase(),
                            ),
                            isMultipleReleased
                                ? '${release.minNumber} - ${release.maxNumber}'
                                : release.number!,
                          ),
                          style: Theme.of(context).textTheme.bodyMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      for (final String langType in release.langTypes)
                        LangTypeComponent(langType: langType),
                      const SizedBox(height: 8),
                      Flex(
                        spacing: 8,
                        direction: Axis.horizontal,
                        children: <Widget>[
                          if ((!isReleased || isMultipleReleased) &&
                              !AnimeWeeklyController.instance.memberMode)
                            WatchlistButton(
                              anime: release.anime,
                              simple: true,
                              style: Theme.of(context).getCardButtonStyle(),
                            ),
                          if (isReleased && !isMultipleReleased) ...<Widget>[
                            WatchlistButton(
                              anime: release.anime,
                              episode: release.mappings!.first,
                              isCalendar: true,
                              simple: true,
                              style: Theme.of(context).getCardButtonStyle(),
                            ),
                            WatchButton(
                              url: release.mappings?.first.variants?.first.url,
                              simple: true,
                            ),
                          ],
                        ],
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
