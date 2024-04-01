import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/platform_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AnimeComponent extends StatelessWidget {
  static const bookmarkColor = Colors.yellow;
  final AnimeDto anime;
  final String? hour;
  final List<PlatformDto>? platforms;

  const AnimeComponent({
    super.key,
    required this.anime,
    this.hour,
    this.platforms,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      '${Constant.apiUrl}/v1/attachments?uuid=${anime.uuid}&type=image',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 280,
                  placeholder: (context, url) => Container(
                    color: Colors.grey,
                    width: double.infinity,
                    height: 280,
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Row(
                    children: [
                      if (platforms != null)
                        for (final platform in platforms!)
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(32),
                              child: CachedNetworkImage(
                                imageUrl:
                                    '${Constant.baseUrl}/assets/img/platforms/${platform.image}',
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                                width: 24,
                                height: 24,
                                placeholder: (context, url) => Container(
                                  color: Colors.grey,
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ),
                          ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              anime.shortName,
              style: Theme.of(context).textTheme.bodyLarge,
              overflow: TextOverflow.ellipsis,
            ),
            if (hour != null)
              Text(
                hour!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
