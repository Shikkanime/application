import 'package:application/core/widgets/app_elevated_dropdown_button.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:application/models/simulcast_model.dart';
import 'package:material_ui/material_ui.dart';

class SimulcastDropdownButton extends StatelessWidget {
  const SimulcastDropdownButton({
    super.key,
    required this.simulcasts,
    this.value,
    required this.onChanged,
  });

  final List<SimulcastModel> simulcasts;
  final SimulcastModel? value;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return AppElevatedDropdownButton<String?>(
      GlobalKey(),
      value: value?.uuid,
      items: [
        AppElevatedPopupMenuEntry(
          value: null,
          child: Text(AppLocalizations.of(context)!.allSimulcasts),
        ),
        for (final simulcast in simulcasts)
          AppElevatedPopupMenuEntry(
            value: simulcast.uuid,
            child: Text(
              AppLocalizations.of(context)!.simulcast(
                AppLocalizations.of(context)!.season(simulcast.season.name),
                simulcast.year,
              ),
            ),
          ),
      ],
      onChanged: onChanged,
    );
  }
}
