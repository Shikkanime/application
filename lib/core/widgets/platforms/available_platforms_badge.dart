import 'package:application/core/widgets/app_blur_badge.dart';
import 'package:application/core/widgets/app_skeleton.dart';
import 'package:application/core/widgets/cached_network_image.dart';
import 'package:application/core/widgets/platforms/platforms_stack.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:application/models/platform_model.dart';
import 'package:application/models/source_model.dart';
import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class AvailablePlatformsBadge extends StatelessWidget {
  const AvailablePlatformsBadge(
    this._globalKey, {
    super.key,
    required this.sources,
  });

  final GlobalKey _globalKey;
  final Iterable<SourceModel> sources;

  Set<PlatformModel> get _platforms =>
      sources.map((source) => source.platform).toSet();

  Future<bool> _launch(String url) async {
    final modes = <LaunchMode>[
      .externalNonBrowserApplication,
      .externalApplication,
      .platformDefault,
    ];

    debugPrint('Launch url...');

    for (final mode in modes) {
      try {
        if (await launchUrl(.parse(url), mode: mode)) {
          return true;
        }
      } on PlatformException catch (e) {
        debugPrint('Failed to launch URL with mode $mode: $e');
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
      child: GestureDetector(
        key: _globalKey,
        onTap: () async {
          if (platforms.length == 1) {
            _launch(sources.first.url);
            return;
          }

          final renderBox =
              _globalKey.currentContext?.findRenderObject() as RenderBox?;
          final overlayBox =
              Navigator.of(context).overlay?.context.findRenderObject()
                  as RenderBox?;

          if (renderBox == null || overlayBox == null) return;

          final topLeft = renderBox.localToGlobal(.zero, ancestor: overlayBox);
          final bottomRight = renderBox.localToGlobal(
            renderBox.size.bottomRight(.zero),
            ancestor: overlayBox,
          );
          final menuWidth = renderBox.size.width < 240
              ? 240.0
              : renderBox.size.width;

          await showMenu(
            context: context,
            position: .fromRect(
              .fromPoints(topLeft, bottomRight),
              Offset.zero & overlayBox.size,
            ),
            constraints: .tightFor(width: menuWidth),
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
                    leading: ClipOval(
                      child: CachedNetworkImage(
                        'https://www.shikkanime.fr/assets/img/platforms/${platform.image}',
                        width: 16,
                        height: 16,
                        fit: .cover,
                        loading: const AppSkeleton(),
                        error: const AppSkeleton(),
                      ),
                    ),
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
    );
  }
}
