import 'package:application/components/card_component.dart';
import 'package:application/components/watchlist_button.dart';
import 'package:application/components/image_component.dart';
import 'package:application/components/lang_type_component.dart';
import 'package:application/components/platforms/list_platform.dart';
import 'package:application/controllers/anime_controller.dart';
import 'package:application/dtos/week_day_release_dto.dart';
import 'package:application/views/anime_details_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class CalendarAnimeComponent extends StatelessWidget {
  static const bookmarkColor = Colors.yellow;
  final WeekDayReleaseDto release;

  const CalendarAnimeComponent({
    super.key,
    required this.release,
  });

  String _releaseHour(String releaseDateTime) {
    final parsed = DateFormat('yyyy-MM-ddTHH:mm:ssZ')
        .parse(releaseDateTime, true)
        .toLocal();

    return '${parsed.hour.toString().padLeft(2, '0')}:${parsed.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AnimeDetailsView(anime: release.anime),
          ),
        );
      },
      onLongPress: (details) {
        AnimeController.instance.onLongPress(context, release.anime, details);
      },
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              ImageComponent(
                uuid: release.anime.uuid,
                type: 'banner',
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                height: 185,
              ),
              Positioned(
                top: 5,
                right: 5,
                child: ListPlatform(platforms: release.platforms),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    _releaseHour(release.releaseDateTime),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: VerticalDivider(
                      color: Colors.white,
                      thickness: 0.5,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          release.anime.shortName,
                          style: Theme.of(context).textTheme.bodyLarge,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        LangTypeComponent(langType: release.langType),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (release.variant != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: GestureDetector(
                            onTap: () {
                              launchUrl(
                                Uri.parse(release.variant!.url),
                                mode: LaunchMode.externalNonBrowserApplication,
                              );
                            },
                            child: const Icon(
                              Icons.live_tv_outlined,
                            ),
                          ),
                        ),
                      WatchlistButton(anime: release.anime),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
