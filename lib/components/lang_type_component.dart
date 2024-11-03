import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LangTypeComponent extends StatelessWidget {
  const LangTypeComponent({required this.langType, super.key});

  final String langType;

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
  Widget build(final BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.bodyMedium;

    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        if (langType == 'SUBTITLES')
          Icon(
            Icons.closed_caption,
            size: 16,
            color: textStyle?.color,
          ),
        if (langType == 'VOICE')
          Icon(
            Icons.mic,
            size: 16,
            color: textStyle?.color,
          ),
        const SizedBox(width: 4),
        Text(
          getLangTypeTranslation(context, langType),
          style: textStyle,
        ),
      ],
    );
  }
}
