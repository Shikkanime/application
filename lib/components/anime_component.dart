import 'package:application/dtos/anime_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AnimeComponent extends StatelessWidget {
  static const bookmarkColor = Colors.yellow;
  final AnimeDto anime;

  const AnimeComponent({
    super.key,
    required this.anime,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
            const SizedBox(height: 8),
            Text(
              anime.shortName,
              style: Theme.of(context).textTheme.bodyLarge,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
