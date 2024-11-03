import 'package:application/components/image_component.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/utils/analytics.dart';
import 'package:application/utils/constant.dart';
import 'package:application/views/anime_details_view.dart';
import 'package:flutter/material.dart';

double _ratio = 4;

class FollowedAnimeComponent extends StatelessWidget {
  const FollowedAnimeComponent({
    required this.anime,
    super.key,
  });

  final AnimeDto anime;

  @override
  Widget build(final BuildContext context) => SizedBox(
        width: 360 / _ratio + 10,
        child: GestureDetector(
          onTap: () {
            Analytics.instance.logSelectContent('anime', anime.uuid);

            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (final BuildContext context) => AnimeDetailsView(
                  anime: anime,
                ),
              ),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 360 / _ratio,
                height: 640 / _ratio,
                child: ImageComponent(
                  uuid: anime.uuid,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(Constant.borderRadius),
                  ),
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
