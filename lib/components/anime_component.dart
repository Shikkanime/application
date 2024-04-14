import 'package:application/components/card_component.dart' as card;
import 'package:application/components/lang_type_component.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:application/views/anime_details_view.dart';
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
    return card.Card(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AnimeDetailsView(anime: anime),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: CachedNetworkImage(
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
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              anime.shortName,
              style: Theme.of(context).textTheme.bodyLarge,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          for (final langType in anime.langTypes)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: LangTypeComponent(langType: langType),
            ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
