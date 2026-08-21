import 'package:application/core/config/env_config.dart';
import 'package:application/core/widgets/app_skeleton.dart';
import 'package:application/core/widgets/cached_network_image.dart';
import 'package:application/core/widgets/lang_types/lang_type_label.dart';
import 'package:application/core/widgets/app_card.dart';
import 'package:application/core/widgets/platforms/available_platforms_badge.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:application/models/source_model.dart';
import 'package:application/models/grouped_episode_model.dart';
import 'package:material_ui/material_ui.dart';

class GroupedEpisodeCard extends StatelessWidget {
  const GroupedEpisodeCard(
    this._groupedEpisode, {
    super.key,
    required this.onSourcePress,
  });

  final GroupedEpisodeModel _groupedEpisode;
  final Future<void> Function(SourceModel source) onSourcePress;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              borderRadius: const .all(.circular(16)),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    '${EnvConfig.apiBaseUrl}/v1/attachments?uuid=${_groupedEpisode.mappings.firstOrNull}&type=BANNER',
                    width: .infinity,
                    fit: .cover,
                    loading: const AppSkeleton(),
                    error: const AppSkeleton(),
                  ),
                  AvailablePlatformsBadge(
                    sources: _groupedEpisode.sources,
                    onSourcePress: onSourcePress,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _groupedEpisode.anime.shortName,
            maxLines: 1,
            overflow: .ellipsis,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            AppLocalizations.of(context)!.episodeDescription(
              _groupedEpisode.season,
              AppLocalizations.of(context)!
                  .episodeType(_groupedEpisode.episodeType.name),
              _groupedEpisode.number,
            ),
            maxLines: 1,
            overflow: .ellipsis,
          ),
          ..._groupedEpisode.sources
              .map((source) => source.langType)
              .toSet()
              .map(LangTypeLabel.new),
        ],
      ),
    );
  }
}
