import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:material_ui/material_ui.dart';

class AppHorizontalListView extends StatefulWidget {
  const AppHorizontalListView({
    super.key,
    this.controller,
    this.spacing = 8,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    required this.children,
  });

  final ScrollController? controller;
  final double spacing;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final List<Widget> children;

  @override
  State<AppHorizontalListView> createState() => _AppHorizontalListViewState();
}

class _AppHorizontalListViewState extends State<AppHorizontalListView> {
  ScrollController? _internalController;

  ScrollController get _effectiveController =>
      widget.controller ?? _internalController!;

  bool _canScrollLeft = false;
  bool _canScrollRight = false;

  bool get _isDesktop {
    if (kIsWeb) return true;
    return switch (defaultTargetPlatform) {
      TargetPlatform.macOS ||
      TargetPlatform.linux ||
      TargetPlatform.windows => true,
      _ => false,
    };
  }

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _internalController = ScrollController();
    }
    _effectiveController.addListener(_updateScrollButtons);
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateScrollButtons());
  }

  @override
  void didUpdateWidget(covariant AppHorizontalListView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_updateScrollButtons);
      if (widget.controller == null) {
        _internalController ??= ScrollController();
      } else if (oldWidget.controller == null) {
        _internalController?.dispose();
        _internalController = null;
      }
      _effectiveController.addListener(_updateScrollButtons);
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => _updateScrollButtons(),
      );
    } else {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => _updateScrollButtons(),
      );
    }
  }

  @override
  void dispose() {
    _effectiveController.removeListener(_updateScrollButtons);
    _internalController?.dispose();
    super.dispose();
  }

  void _updateScrollButtons() {
    if (!mounted) return;
    final controller = _effectiveController;
    if (!controller.hasClients) return;

    final maxScroll = controller.position.maxScrollExtent;
    final currentScroll = controller.offset;

    final canScrollLeft = currentScroll > 0;
    final canScrollRight = currentScroll < maxScroll && maxScroll > 0;

    if (canScrollLeft != _canScrollLeft || canScrollRight != _canScrollRight) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _canScrollLeft = canScrollLeft;
            _canScrollRight = canScrollRight;
          });
        }
      });
    }
  }

  void _scroll(bool left) {
    if (!_effectiveController.hasClients) return;
    final viewportDimension = _effectiveController.position.viewportDimension;
    final scrollAmount = viewportDimension * 0.75;
    final targetOffset = left
        ? (_effectiveController.offset - scrollAmount).clamp(
            0.0,
            _effectiveController.position.maxScrollExtent,
          )
        : (_effectiveController.offset + scrollAmount).clamp(
            0.0,
            _effectiveController.position.maxScrollExtent,
          );

    _effectiveController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildGradientOverlay({
    required BuildContext context,
    required bool isLeft,
    required bool visible,
  }) {
    final bgColor = Theme.of(context).scaffoldBackgroundColor;
    return Positioned(
      left: isLeft ? 0 : null,
      right: isLeft ? null : 0,
      top: 0,
      bottom: 0,
      width: 64,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: visible ? 1.0 : 0.0,
        child: IgnorePointer(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: isLeft ? Alignment.centerLeft : Alignment.centerRight,
                end: isLeft ? Alignment.centerRight : Alignment.centerLeft,
                colors: [bgColor, bgColor.withValues(alpha: 0.0)],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScrollButton({required bool isLeft, required bool visible}) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: visible ? 1.0 : 0.0,
      child: IgnorePointer(
        ignoring: !visible,
        child: Padding(
          padding: const .symmetric(horizontal: 4),
          child: IconButton(
            onPressed: () => _scroll(isLeft),
            icon: Icon(isLeft ? Icons.chevron_left : Icons.chevron_right),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final showDesktopButtons = _isDesktop;

    return Stack(
      clipBehavior: .none,
      alignment: Alignment.center,
      children: [
        NotificationListener<Notification>(
          onNotification: (notification) {
            if (notification is ScrollNotification ||
                notification is ScrollMetricsNotification) {
              _updateScrollButtons();
            }
            return false;
          },
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              scrollbars: false,
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
                PointerDeviceKind.trackpad,
                PointerDeviceKind.stylus,
              },
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  controller: _effectiveController,
                  scrollDirection: .horizontal,
                  child: IntrinsicHeight(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: constraints.maxWidth,
                      ),
                      child: Padding(
                        padding: const .symmetric(vertical: 1),
                        child: Row(
                          spacing: widget.spacing,
                          mainAxisAlignment: widget.mainAxisAlignment,
                          crossAxisAlignment: widget.crossAxisAlignment,
                          children: widget.children,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        if (showDesktopButtons) ...[
          _buildGradientOverlay(
            context: context,
            isLeft: true,
            visible: _canScrollLeft,
          ),
          _buildGradientOverlay(
            context: context,
            isLeft: false,
            visible: _canScrollRight,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: _buildScrollButton(isLeft: true, visible: _canScrollLeft),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: _buildScrollButton(isLeft: false, visible: _canScrollRight),
          ),
        ],
      ],
    );
  }
}
