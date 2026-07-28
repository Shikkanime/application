import 'package:application/l10n/app_localizations.dart';
import 'package:application/models/lang_type.dart';
import 'package:material_ui/material_ui.dart';

class LangTypeLabel extends StatelessWidget {
  const LangTypeLabel(this._langType, {this.color, super.key});

  final LangType _langType;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Flex(
      spacing: 4,
      direction: .horizontal,
      mainAxisSize: .min,
      children: [
        switch (_langType) {
          .subtitles => Icon(Icons.closed_caption, size: 16, color: color),
          .voice => Icon(Icons.mic, size: 16, color: color),
        },
        Flexible(
          child: Text(
            AppLocalizations.of(context)!.langType(_langType.name),
            maxLines: 1,
            overflow: .ellipsis,
            style: Theme.of(context).textTheme.bodyMedium
                ?.copyWith(color: color),
          ),
        ),
      ],
    );
  }
}
