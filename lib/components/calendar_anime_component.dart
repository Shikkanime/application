import 'package:application/components/lang_type_component.dart';
import 'package:application/components/platform_component.dart';
import 'package:application/dtos/week_day_release_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CalendarAnimeComponent extends StatelessWidget {
  static const bookmarkColor = Colors.yellow;
  final WeekDayReleaseDto release;

  const CalendarAnimeComponent({
    super.key,
    required this.release,
  });

  String _releaseHour(String releaseDateTime) {
    final parsed = DateTime.parse(releaseDateTime).toLocal();
    return '${parsed.hour.toString().padLeft(2, '0')}:${parsed.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.surface,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: 200,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          _releaseHour(release.releaseDateTime),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: VerticalDivider(
                            color: Theme.of(context).colorScheme.surface,
                            thickness: 1,
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
          ),
        ),
      ),
    );
  }
}
