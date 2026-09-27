import 'package:application/core/config/env_config.dart';
import 'package:application/core/widgets/app_skeleton.dart';
import 'package:application/core/widgets/cached_network_image.dart';
import 'package:application/core/widgets/lang_types/lang_type_label.dart';
import 'package:application/core/widgets/app_card.dart';
import 'package:application/core/widgets/platforms/platforms_badge.dart';
import 'package:application/models/anime_model.dart';
import 'package:material_ui/material_ui.dart';

class AnimeCard extends StatelessWidget {
  const AnimeCard(this._anime, {super.key});

  final AnimeModel _anime;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          AspectRatio(
            aspectRatio: 9 / 16,
            child: ClipRRect(
              borderRadius: const .all(.circular(16)),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    '${EnvConfig.apiBaseUrl}/v1/attachments?uuid=${_anime.uuid}&type=THUMBNAIL',
                    height: .infinity,
                    fit: .cover,
                    loading: const AppSkeleton(),
                    error: const AppSkeleton(),
                  ),
                  PlatformsBadge(
                    platforms: _anime.platformIds
                        .map((source) => source.platform)
                        .toSet(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _anime.shortName,
            maxLines: 1,
            overflow: .ellipsis,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          ..._anime.langTypes.map(LangTypeLabel.new),
        ],
      ),
    );
  }
}
