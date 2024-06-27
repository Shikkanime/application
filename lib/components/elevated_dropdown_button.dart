import 'package:flutter/material.dart';

class ElevatedDropdownButton<T> extends StatelessWidget {
  final GlobalKey globalKey;
  final T? value;
  final List<ElevatedPopupMenuItem<T>> items;
  final Function(T) onChanged;
  final bool showIcon;
  final Widget? child;

  const ElevatedDropdownButton({
    super.key,
    required this.globalKey,
    required this.value,
    required this.items,
    required this.onChanged,
    this.showIcon = true,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: globalKey,
      onPressed: () {
        final renderBox =
            globalKey.currentContext!.findRenderObject() as RenderBox;
        // Get position of the season button
        final position = renderBox.localToGlobal(Offset.zero);

        showMenu<T>(
          context: context,
          position: RelativeRect.fromLTRB(
            position.dx,
            position.dy,
            position.dx,
            position.dy,
          ),
          items: [...items.map((item) => item.build())],
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.3075,
          ),
        ).then((value) {
          if (value != null) {
            onChanged(value);
          }
        });
      },
      child: Flex(
        direction: Axis.horizontal,
        children: [
          if (child != null)
            child!
          else
            items
                .firstWhere(
                  (item) => item.value == value,
                  orElse: () => items.first,
                )
                .child,
          if (showIcon) ...[
            const SizedBox(width: 8),
            const Icon(Icons.arrow_drop_down),
          ],
        ],
      ),
    );
  }
}

class ElevatedPopupMenuItem<T> {
  final T value;
  final Widget? leading;
  final Widget child;

  const ElevatedPopupMenuItem({
    required this.value,
    this.leading,
    required this.child,
  });

  PopupMenuItem<T> build() {
    return PopupMenuItem<T>(
      value: value,
      child: Row(
        children: [
          if (leading != null) leading!,
          const SizedBox(width: 8),
          child,
        ],
      ),
    );
  }
}
