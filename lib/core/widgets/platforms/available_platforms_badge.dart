import 'package:application/core/logger/app_logger.dart';
import 'package:application/core/widgets/app_blur_badge.dart';
import 'package:application/core/widgets/platforms/platform_image.dart';
import 'package:application/core/widgets/platforms/platforms_stack.dart';
import 'package:application/core/widgets/show_app_menu.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:application/models/platform_model.dart';
import 'package:application/models/source_model.dart';
import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class AvailablePlatformsBadge extends StatelessWidget {
  const AvailablePlatformsBadge({super.key, required this.sources});

  final Iterable<SourceModel> sources;

  Set<PlatformModel> get _platforms =>
      sources.map((source) => source.platform).toSet();

  Future<bool> _launch(String url) async {
    final modes = <LaunchMode>[
      .externalNonBrowserApplication,
      .externalApplication,
      .platformDefault,
    ];

    AppLogger.print('Launch url: $url...');

    for (final mode in modes) {
      try {
        if (await launchUrl(.parse(url), mode: mode)) {
          return true;
        }
      } on PlatformException catch (e) {
        AppLogger.print('Failed to launch URL with mode $mode: $e');
      }
    }

    return false;
  }

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
              _launch(sources.first.url);
              return;
            }

            showAppPopupMenu(
              context: context,
              items: [
                for (final platform in platforms)
                  PopupMenuItem(
                    onTap: () {
                      final source = sources.singleWhere(
                        (source) => source.platform.name == platform.name,
                      );
                      _launch(source.url);
                    },
                    child: ListTile(
                      leading: PlatformImage(platform, width: 16, height: 16),
                      title: Text(platform.name),
                      trailing: const Icon(Icons.north_east),
                    ),
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
