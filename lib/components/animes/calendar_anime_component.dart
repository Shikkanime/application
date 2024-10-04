import 'package:application/components/card_component.dart';
import 'package:application/components/watch_button.dart';
import 'package:application/components/watchlist_button.dart';
import 'package:application/components/image_component.dart';
import 'package:application/components/lang_type_component.dart';
import 'package:application/components/platforms/list_platform.dart';
import 'package:application/controllers/anime_controller.dart';
import 'package:application/controllers/anime_weekly_controller.dart';
import 'package:application/dtos/week_day_release_dto.dart';
import 'package:application/utils/analytics.dart';
import 'package:application/utils/constant.dart';
import 'package:application/utils/memory_cache.dart';
import 'package:application/views/anime_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:image/image.dart' as img;

class CalendarAnimeComponent extends StatelessWidget {
  final WeekDayReleaseDto release;

  const CalendarAnimeComponent({
    super.key,
    required this.release,
  });

  String _releaseHour(BuildContext context, String releaseDateTime) {
    final parsed = DateFormat('yyyy-MM-ddTHH:mm:ssZ')
        .parse(releaseDateTime, true)
        .toLocal();

    return DateFormat(AppLocalizations.of(context)!.calendarTimeFormat)
        .format(parsed);
  }

  Future<Color?> _getDominantColor(String src) async {
    try {
      if (MemoryCache.instance.get(src) != null) {
        return MemoryCache.instance.get(src);
      }

      final ByteData data = await NetworkAssetBundle(Uri.parse(src)).load(src);
      final Uint8List list = data.buffer.asUint8List();
      final img.Image? image = img.decodeImage(list);

      if (image == null) return null;

      final colorCounts = <int, int>{};
      final totalPixels = image.width * image.height;

      for (int y = 0; y < image.height; y++) {
        for (int x = 0; x < image.width; x++) {
          final pixel = image.getPixel(x, y);
          final rgb = (pixel.r.toInt() << 16) |
              (pixel.g.toInt() << 8) |
              pixel.b.toInt();
          colorCounts[rgb] = (colorCounts[rgb] ?? 0) + 1;
        }
      }

      int redSum = 0, greenSum = 0, blueSum = 0;

      colorCounts.forEach((rgb, count) {
        redSum += ((rgb >> 16) & 0xFF) * count;
        greenSum += ((rgb >> 8) & 0xFF) * count;
        blueSum += (rgb & 0xFF) * count;
      });

      final color = Color.fromRGBO(
        (redSum / totalPixels).round(),
        (greenSum / totalPixels).round(),
        (blueSum / totalPixels).round(),
        1,
      );

      MemoryCache.instance.set(src, color);
      return color;
    } catch (e) {
      debugPrint('Error getting dominant color: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isReleased = release.mappings != null && release.mappings!.isNotEmpty;
    final isMultipleReleased = isReleased && release.mappings!.length > 1;

    return CustomCard(
      activateLayers: isMultipleReleased,
      layerColor: isMultipleReleased
          ? _getDominantColor(
              '${Constant.apiUrl}/v1/attachments?uuid=${release.mappings!.first.uuid}&type=image')
          : null,
      onTap: () {
        Analytics.instance.logSelectContent('anime', release.anime.uuid);

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
                fit: BoxFit.cover,
                uuid: isReleased
                    ? release.mappings!.first.uuid
                    : release.anime.uuid,
                type: isReleased ? 'image' : 'banner',
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(Constant.borderRadius),
                  topRight: Radius.circular(Constant.borderRadius),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                        LangTypeComponent(
                          langType: release.langType,
                        ),
                        Flex(
                          direction: Axis.horizontal,
                          children: [
                            if ((!isReleased || isMultipleReleased) &&
                                !AnimeWeeklyController.instance.memberMode)
                              WatchlistButton(anime: release.anime),
                            if (isReleased && !isMultipleReleased) ...[
                              if (!AnimeWeeklyController
                                  .instance.memberMode) ...[
                                WatchlistButton(
                                  anime: release.anime,
                                  episode: release.mappings!.first,
                                  isCalendar: true,
                                ),
                                const SizedBox(width: 8),
                              ],
                              WatchButton(
                                url:
                                    release.mappings?.first.variants?.first.url,
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
          ),
        ],
      ),
    );
  }
}
