import 'package:application/components/card_component.dart' as card;
import 'package:application/components/lang_type_component.dart';
import 'package:application/components/platform_component.dart';
import 'package:application/dtos/week_day_release_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    return card.Card(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 185,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        '${Constant.apiUrl}/v1/attachments?uuid=${release.anime.uuid}&type=banner',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                    width: double.infinity,
                    placeholder: (context, url) => Container(
                      color: Colors.grey,
                      width: double.infinity,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Row(
                    children: [
                      for (final platform in release.platforms)
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: PlatformComponent(platform: platform),
                        ),
                    ],
                  ),
                ),
              ],
            ),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
