import 'package:application/core/widgets/app_blur_badge.dart';
import 'package:application/core/widgets/platforms/platform_image.dart';
import 'package:application/core/widgets/platforms/platforms_stack.dart';
import 'package:application/core/widgets/show_app_menu.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:application/models/platform_model.dart';
import 'package:application/models/source_model.dart';
import 'package:material_ui/material_ui.dart';

class AvailablePlatformsBadge extends StatelessWidget {
  const AvailablePlatformsBadge({
    super.key,
    required this.sources,
    required this.onSourcePress,
  });

  final Iterable<SourceModel> sources;
  final Future<void> Function(SourceModel source) onSourcePress;

  Set<PlatformModel> get _platforms =>
      sources.map((source) => source.platform).toSet();

  @override
  Widget build(BuildContext context) {
    final platforms = _platforms;
    final labelSmall = Theme.of(context).textTheme.labelSmall;

    return Positioned(
      left: 8,
      bottom: 8,
      child: Builder(
        builder: (context) => GestureDetector(
          onTap: () {
            if (platforms.length == 1) {
              onSourcePress(sources.first);
              return;
            }

            showAppPopupMenu(
              context: context,
              items: [
                for (final platform in platforms)
                  PopupMenuItem(
                    child: ListTile(
                      leading: PlatformImage(platform, width: 16, height: 16),
                      title: Text(platform.name),
                      trailing: const Icon(Icons.north_east),
                    ),
                    onTap: () {
                      for (final source in sources) {
                        if (source.platform.name == platform.name) {
                          onSourcePress(source);
                          break;
                        }
                      }
                    },
                  ),
              ],
            );
          },
          child: AppBlurBadge(
            child: Flex(
              direction: .horizontal,
              spacing: 4,
              children: [
                Icon(
                  Icons.open_in_new,
                  color: labelSmall?.color,
                  size: labelSmall?.fontSize,
                ),
                Text(
                  AppLocalizations.of(context)!.availableOn,
                  style: labelSmall,
                ),
                PlatformsStack(platforms: platforms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
