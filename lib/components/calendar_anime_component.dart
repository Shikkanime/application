import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/platform_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CalendarAnimeComponent extends StatelessWidget {
  static const bookmarkColor = Colors.yellow;
  final AnimeDto anime;
  final String hour;
  final List<PlatformDto> platforms;

  const CalendarAnimeComponent({
    super.key,
    required this.anime,
    required this.hour,
    required this.platforms,
  });

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
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
            child: Row(
              children: <Widget>[
                Text(
                  hour,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            '${Constant.apiUrl}/v1/attachments?uuid=${anime.uuid}&type=banner',
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: 100,
                        placeholder: (context, url) => Container(
                          color: Colors.grey,
                          width: double.infinity,
                          height: 100,
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: Row(
                          children: [
                            for (final platform in platforms)
                              Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(32),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        '${Constant.baseUrl}/assets/img/platforms/${platform.image}',
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                    width: 20,
                                    height: 20,
                                    placeholder: (context, url) => Container(
                                      color: Colors.grey,
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    anime.shortName,
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
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
