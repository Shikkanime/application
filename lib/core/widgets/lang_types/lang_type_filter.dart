import 'package:application/core/theme/app_theme_colors.dart';
import 'package:application/core/widgets/app_elevated_check_button.dart';
import 'package:application/core/widgets/app_horizontal_list_view.dart';
import 'package:application/core/widgets/lang_types/lang_type_label.dart';
import 'package:application/models/lang_type.dart';
import 'package:application/viewmodels/lang_type_filter_view_model.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

class LangTypeFilter<T extends LangTypeFilterViewModel>
    extends StatelessWidget {
  const LangTypeFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, viewModel, child) {
        final inverseTextColor = Theme.of(context)
            .extension<AppThemeExtension>()
            ?.inverseTextColor;

        return AppHorizontalListView(
          spacing: 8,
          mainAxisAlignment: .start,
          children: [
            for (final langType in LangType.values)
              AppElevatedCheckButton(
                value: viewModel.isLangTypeSelected(langType),
                onChanged: (value) => viewModel.onChanged(langType),
                child: LangTypeLabel(
                  langType,
                  color: viewModel.isLangTypeSelected(langType)
                      ? inverseTextColor
                      : null,
                ),
              ),
          ],
        );
      },
    );
  }
}
