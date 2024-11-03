import 'package:flutter/material.dart';

class ElevatedDropdownButton<T> extends StatelessWidget {
  const ElevatedDropdownButton({
    required this.globalKey,
    required this.value,
    required this.items,
    required this.onChanged,
    super.key,
    this.showIcon = true,
    this.child,
  });

  final GlobalKey globalKey;
  final T? value;
  final List<ElevatedPopupMenuItem<T>> items;
  final Function(T) onChanged;
  final bool showIcon;
  final Widget? child;

  @override
  Widget build(final BuildContext context) => ElevatedButton(
        key: globalKey,
        onPressed: () {
          final RenderBox renderBox =
              globalKey.currentContext!.findRenderObject()! as RenderBox;
          // Get position of the season button
          final Offset position = renderBox.localToGlobal(Offset.zero);

          showMenu<T>(
            context: context,
            position: RelativeRect.fromLTRB(
              position.dx,
              position.dy,
              position.dx,
              position.dy,
            ),
            items: <PopupMenuEntry<T>>[
              ...items.map(
                (final ElevatedPopupMenuItem<T> item) =>
                    item.build(selected: item.value == value),
              ),
            ],
            constraints: BoxConstraints(
              maxHeight: MediaQuery.sizeOf(context).height * 0.3075,
            ),
          ).then((final T? value) {
            if (value != null) {
              onChanged(value);
            }
          });
        },
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            if (child != null)
              child!
            else
              items
                  .firstWhere(
                    (final ElevatedPopupMenuItem<T> item) =>
                        item.value == value,
                    orElse: () => items.first,
                  )
                  .child,
            if (showIcon) ...<Widget>[
              const SizedBox(width: 8),
              const Icon(Icons.arrow_drop_down),
            ],
          ],
        ),
      );
}

class ElevatedPopupMenuItem<T> {
  const ElevatedPopupMenuItem({
    required this.value,
    required this.child,
  });
  final T value;
  final Widget child;

  PopupMenuItem<T> build({final bool selected = false}) => PopupMenuItem<T>(
        value: value,
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            child,
            if (selected) ...<Widget>[
              const SizedBox(width: 8),
              const Icon(Icons.check),
            ],
          ],
        ),
      );
}
