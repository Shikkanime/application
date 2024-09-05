import 'package:application/components/image_component.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/utils/analytics.dart';
import 'package:application/utils/constant.dart';
import 'package:application/views/anime_details_view.dart';
import 'package:flutter/material.dart';

double _ratio = 4;

class FollowedAnimeComponent extends StatelessWidget {
  final AnimeDto anime;

  const FollowedAnimeComponent({
    super.key,
    required this.anime,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360 / _ratio + 10,
      child: GestureDetector(
        onTap: () {
          Analytics.instance.logSelectContent('anime', anime.uuid);

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AnimeDetailsView(anime: anime),
            ),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 360 / _ratio,
              height: 640 / _ratio,
              child: ImageComponent(
                uuid: anime.uuid,
                borderRadius: BorderRadius.circular(Constant.borderRadius),
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                anime.shortName,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
