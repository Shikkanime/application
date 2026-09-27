import 'package:material_ui/material_ui.dart';

Future<T?> showAppPopupMenu<T>({
  required BuildContext context,
  required List<PopupMenuEntry<T>> items,
  double minWidth = 240,
}) async {
  final renderBox = context.findRenderObject() as RenderBox?;
  final overlayBox =
      Navigator.of(context).overlay?.context.findRenderObject() as RenderBox?;

  if (renderBox == null || overlayBox == null || items.isEmpty) {
    return null;
  }

  final topLeft = renderBox.localToGlobal(.zero, ancestor: overlayBox);
  final bottomRight = renderBox.localToGlobal(
    renderBox.size.bottomRight(.zero),
    ancestor: overlayBox,
  );
  final menuWidth = renderBox.size.width < 240 ? 240.0 : renderBox.size.width;

  return await showMenu<T>(
    context: context,
    position: .fromRect(
      .fromPoints(topLeft, bottomRight),
      Offset.zero & overlayBox.size,
    ),
    constraints: .tightFor(width: menuWidth),
    items: items,
  );
}
