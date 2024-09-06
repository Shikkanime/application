import 'package:application/components/card_component.dart';
import 'package:application/components/watchlist_button.dart';
import 'package:application/components/image_component.dart';
import 'package:application/components/lang_type_component.dart';
import 'package:application/components/platforms/list_platform.dart';
import 'package:application/controllers/anime_controller.dart';
import 'package:application/dtos/week_day_release_dto.dart';
import 'package:application/utils/analytics.dart';
import 'package:application/views/anime_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:palette_generator/palette_generator.dart';

class CalendarAnimeComponent extends StatefulWidget {
  final WeekDayReleaseDto release;

  const CalendarAnimeComponent({
    super.key,
    required this.release,
  });

  @override
  State<CalendarAnimeComponent> createState() => _CalendarAnimeComponentState();
}

class _CalendarAnimeComponentState extends State<CalendarAnimeComponent> {
  Color? _layerColor;

  String _releaseHour(String releaseDateTime) {
    final parsed = DateFormat('yyyy-MM-ddTHH:mm:ssZ')
        .parse(releaseDateTime, true)
        .toLocal();

    return '${parsed.hour.toString().padLeft(2, '0')}:${parsed.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      activateLayers: widget.release.isMultipleReleased && _layerColor != null,
      layerColor: _layerColor,
      onTap: () {
        Analytics.instance.logSelectContent('anime', widget.release.anime.uuid);

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AnimeDetailsView(anime: widget.release.anime),
          ),
        );
      },
      onLongPress: (details) {
        AnimeController.instance
            .onLongPress(context, widget.release.anime, details);
      },
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              ImageComponent(
                uuid: widget.release.isReleased
                    ? widget.release.mappings.first
                    : widget.release.anime.uuid,
                type: widget.release.isReleased ? 'image' : 'banner',
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                height: 185,
                builder: (imageProvider) {
                  if (_layerColor == null) {
                    _getDominantColor(imageProvider).then((color) {
                      if (mounted && _layerColor == null) {
                        setState(() {
                          _layerColor = color;
                        });
                      }
                    });
                  }
                },
              ),
              Positioned(
                top: 5,
                right: 5,
                child: ListPlatform(platforms: widget.release.platforms),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    _releaseHour(widget.release.releaseDateTime),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: VerticalDivider(
                      color: Colors.white,
                      thickness: 0.5,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.release.anime.shortName,
                          style: Theme.of(context).textTheme.bodyLarge,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        if (widget.release.isReleased)
                          Text(
                            AppLocalizations.of(context)!.minInformation(
                              AppLocalizations.of(context)!.episodeType(
                                widget.release.episodeType!.toLowerCase(),
                              ),
                              widget.release.isMultipleReleased
                                  ? '${widget.release.minNumber} - ${widget.release.maxNumber}'
                                  : widget.release.number!,
                            ),
                            style: Theme.of(context).textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        LangTypeComponent(langType: widget.release.langType),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  WatchlistButton(anime: widget.release.anime),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<Color> _getDominantColor(
      final ImageProvider<Object> imageProvider) async {
    return (await PaletteGenerator.fromImageProvider(imageProvider))
        .dominantColor!
        .color;
  }
}
