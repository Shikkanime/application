import 'package:application/components/card_component.dart';
import 'package:application/components/episodes/episode_duration.dart';
import 'package:application/components/image_component.dart';
import 'package:application/components/lang_type_component.dart';
import 'package:application/components/platforms/platform_component.dart';
import 'package:application/components/watch_button.dart';
import 'package:application/components/watchlist_button.dart';
import 'package:application/controllers/animes/anime_controller.dart';
import 'package:application/controllers/animes/anime_weekly_controller.dart';
import 'package:application/dtos/enums/image_type.dart';
import 'package:application/dtos/week_day_release_dto.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:application/utils/analytics.dart';
import 'package:application/utils/constant.dart';
import 'package:application/utils/extensions.dart';
import 'package:application/views/anime_details_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarAnimeComponent extends StatelessWidget {
  const CalendarAnimeComponent({required this.release, super.key});

  final WeekDayReleaseDto release;

  String _releaseHour(
    final BuildContext context,
    final String releaseDateTime,
  ) {
    final DateTime parsed = DateFormat(
      'yyyy-MM-ddTHH:mm:ssZ',
    ).parse(releaseDateTime, true).toLocal();

    return DateFormat(
      AppLocalizations.of(context)!.calendarTimeFormat,
    ).format(parsed);
  }

  String _formatReleaseNumber({
    required final bool isMultipleReleased,
    final int? number,
    final int? minNumber,
    final int? maxNumber,
  }) {
    if (isMultipleReleased) {
      final bool hasRange =
          minNumber != null && maxNumber != null && minNumber != maxNumber;

      if (hasRange) {
        return '$minNumber - $maxNumber';
      }

      final int? single = minNumber ?? maxNumber;
      return single?.toString() ?? '';
    }

    return number?.toString() ?? '';
  }

  @override
  Widget build(final BuildContext context) {
    final bool isReleased = release.mappings?.isNotEmpty ?? false;
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
                uuid: isReleased
                    ? release.mappings!.first.uuid
                    : release.anime.uuid,
                type: ImageType.banner,
                borderRadius: const BorderRadius.all(
                  Radius.circular(Constant.borderRadius),
                ),
                placeholderHeight: AnimeWeeklyController.instance
                    .placeholderHeight(context),
              ),
              ...PlatformComponent.toPlatformsRow(release.platforms),
              if (isReleased && !isMultipleReleased)
                Positioned(
                  bottom: Constant.cornerPadding,
                  right: Constant.cornerPadding,
                  child: EpisodeDuration(
                    duration: release.mappings!.first.duration,
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: VerticalDivider(thickness: 0.5),
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
                            AppLocalizations.of(
                              context,
                            )!.episodeType(release.episodeType!.toLowerCase()),
                            _formatReleaseNumber(
                              isMultipleReleased: isMultipleReleased,
                              minNumber: release.minNumber,
                              maxNumber: release.maxNumber,
                              number: release.number,
                            ),
                          ),
                          style: Theme.of(context).textTheme.bodyMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ...release.langTypes.map(
                        (final String langType) =>
                            LangTypeComponent(langType: langType),
                      ),
                      const SizedBox(height: 8),
                      Flex(
                        spacing: 8,
                        direction: Axis.horizontal,
                        children: <Widget>[
                          if ((!isReleased || isMultipleReleased) &&
                              !AnimeWeeklyController.instance.isWatchlist)
                            WatchlistButton(
                              anime: release.anime.uuid,
                              isAnime: true,
                              simple: true,
                              style: Theme.of(context).cardButtonStyle,
                            ),
                          if (isReleased && !isMultipleReleased) ...<Widget>[
                            WatchlistButton(
                              anime: release.anime.uuid,
                              episode: release.mappings!.first.uuid,
                              isEpisode: true,
                              simple: true,
                              style: Theme.of(context).cardButtonStyle,
                            ),
                            WatchButton(
                              url: release.mappings!.first.variants!.first.url,
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
