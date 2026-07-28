import 'package:application/core/config/env_config.dart';
import 'package:application/core/widgets/app_skeleton.dart';
import 'package:application/core/widgets/cached_network_image.dart';
import 'package:application/core/widgets/lang_types/lang_type_label.dart';
import 'package:application/core/widgets/app_card.dart';
import 'package:application/core/widgets/platforms_badge.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:application/models/weekly_release_model.dart';
import 'package:material_ui/material_ui.dart';
import 'package:intl/intl.dart';

class ReleaseCard extends StatelessWidget {
  const ReleaseCard(this._release, {super.key});

  final WeeklyReleaseModel _release;

  @override
  Widget build(BuildContext context) {
    final isRelease =
        _release.mappings != null && _release.mappings!.isNotEmpty;
    final isMultipleRelease = isRelease && _release.mappings!.length > 1;
    final releaseUuid = isRelease
        ? _release.mappings!.first.uuid
        : _release.anime.uuid;

    return AppCard(
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        spacing: 8,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              borderRadius: const .all(.circular(16)),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    '${EnvConfig.apiBaseUrl}/v1/attachments?uuid=$releaseUuid&type=BANNER',
                    height: .infinity,
                    fit: .cover,
                    loading: const AppSkeleton(),
                    error: const AppSkeleton(),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: PlatformsBadge(platforms: _release.platforms),
                  ),
                ],
              ),
            ),
          ),
          IntrinsicHeight(
            child: Flex(
              direction: .horizontal,
              spacing: 4,
              children: [
                Text(
                  DateFormat.Hm().format(_release.releaseDateTime.toLocal()),
                ),
                const VerticalDivider(thickness: 0.75),
                Expanded(
                  child: Column(
                    mainAxisSize: .min,
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        _release.anime.shortName,
                        maxLines: 1,
                        overflow: .ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      if (isRelease)
                        Text(
                          '${AppLocalizations.of(context)!.episodeType(_release.episodeType.name)} ${isMultipleRelease ? '${_release.minNumber} - ${_release.maxNumber}' : _release.number}',
                        ),
                      ..._release.langTypes.map(LangTypeLabel.new),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
