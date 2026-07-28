import 'package:material_ui/material_ui.dart';

class AppElevatedDropdownButton<T> extends StatelessWidget {
  const AppElevatedDropdownButton(
    this._globalKey, {
    super.key,
    this.value,
    required this.items,
    required this.onChanged,
  });

  final GlobalKey _globalKey;
  final T? value;
  final List<AppElevatedPopupMenuEntry<T>> items;
  final ValueChanged<T> onChanged;

  AppElevatedPopupMenuEntry<T>? _getSelectedItem() {
    for (final item in items) {
      if (item.value == value) return item;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final selectedItem = _getSelectedItem();

    return ElevatedButton(
      key: _globalKey,
      onPressed: () async {
        final renderBox =
            _globalKey.currentContext?.findRenderObject() as RenderBox?;
        final overlayBox =
            Navigator.of(context).overlay?.context.findRenderObject()
                as RenderBox?;

        if (renderBox == null || overlayBox == null || items.isEmpty) return;

        final topLeft = renderBox.localToGlobal(.zero, ancestor: overlayBox);
        final bottomRight = renderBox.localToGlobal(
          renderBox.size.bottomRight(.zero),
          ancestor: overlayBox,
        );
        final maxHeight = MediaQuery.heightOf(context) * 0.3;
        final menuHeight = (items.length * kMinInteractiveDimension)
            .clamp(0.0, maxHeight)
            .toDouble();
        final menuWidth = renderBox.size.width < 240
            ? 240.0
            : renderBox.size.width;

        final selection = await showMenu<_MenuSelection<T>>(
          context: context,
          position: .fromRect(
            .fromPoints(topLeft, bottomRight),
            Offset.zero & overlayBox.size,
          ),
          constraints: .tightFor(width: menuWidth),
          items: [
            _LazyPopupMenuEntry<T>(
              height: menuHeight,
              selectedValue: value,
              items: items,
            ),
          ],
        );

        if (selection != null) {
          onChanged(selection.value);
        }
      },
      child: Flex(
        spacing: 8,
        direction: .horizontal,
        children: [
          if (selectedItem != null) selectedItem.child,
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}

class AppElevatedPopupMenuEntry<T> {
  const AppElevatedPopupMenuEntry({required this.value, required this.child});

  final T value;
  final Widget child;
}

class _MenuSelection<T> {
  const _MenuSelection(this.value);

  final T value;
}

class _LazyPopupMenuEntry<T> extends PopupMenuEntry<_MenuSelection<T>> {
  const _LazyPopupMenuEntry({
    required this.height,
    required this.items,
    required this.selectedValue,
  });

  @override
  final double height;

  final List<AppElevatedPopupMenuEntry<T>> items;
  final T? selectedValue;

  @override
  bool represents(_MenuSelection<T>? value) => selectedValue == value?.value;

  @override
  State<_LazyPopupMenuEntry<T>> createState() => _LazyPopupMenuEntryState<T>();
}

class _LazyPopupMenuEntryState<T> extends State<_LazyPopupMenuEntry<T>> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: ListView.builder(
        padding: .zero,
        itemCount: widget.items.length,
        itemExtent: kMinInteractiveDimension,
        itemBuilder: (context, index) {
          final item = widget.items[index];
          final selected = item.value == widget.selectedValue;

          return InkWell(
            onTap: () => Navigator.pop(context, _MenuSelection<T>(item.value)),
            child: Padding(
              padding: const .symmetric(horizontal: 16),
              child: Row(
                spacing: 8,
                children: [
                  Expanded(child: item.child),
                  if (selected) const Icon(Icons.check),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
