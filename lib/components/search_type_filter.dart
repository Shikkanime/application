import 'package:application/components/elevated_async_button.dart';
import 'package:application/components/lang_type_component.dart';
import 'package:application/controllers/searchable_controller.dart';
import 'package:application/enums/search_type.dart';
import 'package:application/utils/extensions.dart';
import 'package:flutter/material.dart';

class SearchTypeFilter extends StatelessWidget {
  const SearchTypeFilter({required this.controller, super.key});

  final SearchableController controller;

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);

    ButtonStyle? getActiveButtonStyle(final bool isActive) => isActive
        ? theme.elevatedButtonTheme.style?.copyWith(
            backgroundColor: WidgetStateProperty.all(theme.colorScheme.primary),
          )
        : null;

    Color? getTextColor(final bool isActive) =>
        isActive ? theme.oppositeTextColor : theme.textTheme.bodyLarge?.color;

    return Row(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      children: SearchType.values.map((final SearchType type) {
        final bool isActive = controller.searchType == type;

        return ElevatedAsyncButton(
          style: getActiveButtonStyle(isActive),
          onPressed: () async {
            controller.searchType = isActive ? null : type;
            await controller.onSearchTypeChanged();
          },
          child: LangTypeComponent(
            langType: type.name.toUpperCase(),
            color: getTextColor(isActive),
          ),
        );
      }).toList(),
    );
  }
}
