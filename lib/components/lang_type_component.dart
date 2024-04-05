import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LangTypeComponent extends StatelessWidget {
  final String langType;

  const LangTypeComponent({super.key, required this.langType});

  String _langType(BuildContext context) {
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
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium;

    return Flex(
      direction: Axis.horizontal,
      children: [
        if (langType == 'SUBTITLES')
          Icon(
            Icons.closed_caption,
            size: 16,
            color: textStyle?.color,
          ),
        if (langType == 'VOICE')
          Icon(
            Icons.record_voice_over,
            size: 16,
            color: textStyle?.color,
          ),
        const SizedBox(width: 4),
        Text(
          _langType(context),
          style: textStyle,
        ),
      ],
    );
  }
}
