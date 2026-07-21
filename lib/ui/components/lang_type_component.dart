import 'package:application/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class LangTypeComponent extends StatelessWidget {
  const LangTypeComponent({required this.langType, super.key, this.color});

  final String langType;
  final Color? color;

  static String getLangTypeTranslation(
    final BuildContext context,
    final String langType,
  ) {
    switch (langType) {
      case 'SUBTITLES':
        return AppLocalizations.of(context)!.subtitles;
      case 'VOICE':
        return AppLocalizations.of(context)!.voice;
      default:
        return '';
    }
  }

  @override
  Widget build(final BuildContext context) => Flex(
    spacing: 4,
    direction: Axis.horizontal,
    children: <Widget>[
      if (langType == 'SUBTITLES')
        Icon(
          Icons.closed_caption,
          size: 16,
          color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
        ),
      if (langType == 'VOICE')
        Icon(
          Icons.mic,
          size: 16,
          color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
        ),
      Text(
        getLangTypeTranslation(context, langType),
        style: TextStyle(
          color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
        ),
      ),
    ],
  );
}
