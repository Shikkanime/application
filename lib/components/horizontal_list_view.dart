import 'package:application/utils/constant.dart';
import 'package:flutter/material.dart';

class HorizontalListView extends StatefulWidget {
  const HorizontalListView({
    required this.children,
    this.scrollController,
    this.spacing = 8,
    super.key,
  });

  final List<Widget> children;
  final ScrollController? scrollController;
  final double spacing;

  @override
  State<HorizontalListView> createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  late final ScrollController _scrollController;
  bool _showLeftButton = false;
  bool _showRightButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
    _scrollController.addListener(_updateButtons);
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateButtons());
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateButtons);

    if (widget.scrollController == null) {
      _scrollController.dispose();
    }

    super.dispose();
  }

  void _updateButtons() {
    if (!_scrollController.hasClients ||
        !_scrollController.position.hasContentDimensions) {
      return;
    }

    final double offset = _scrollController.offset;
    final double maxScrollExtent = _scrollController.position.maxScrollExtent;

    final bool showLeft = offset > 0;
    final bool showRight = offset < maxScrollExtent;

    if (showLeft != _showLeftButton || showRight != _showRightButton) {
      if (mounted) {
        setState(() {
          _showLeftButton = showLeft;
          _showRightButton = showRight;
        });
      }
    }
  }

  void _scroll(final double delta) {
    _scrollController.animateTo(
      (_scrollController.offset + delta).clamp(
        0,
        _scrollController.position.maxScrollExtent,
      ),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(final BuildContext context) {
    final bool isLargeDevice =
        !Constant.isAndroidOrIOS || MediaQuery.widthOf(context) > 720;

    return NotificationListener<ScrollMetricsNotification>(
      onNotification: (final ScrollMetricsNotification notification) {
        _updateButtons();
        return true;
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          ScrollConfiguration(
            behavior: ScrollConfiguration.of(
              context,
            ).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: Row(
                    spacing: widget.spacing,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: widget.children,
                  ),
                ),
              ),
            ),
          ),
          if (isLargeDevice) ...<Widget>[
            _buildAnimatedScrollButton(
              Icons.chevron_left,
              true,
              _showLeftButton,
            ),
            _buildAnimatedScrollButton(
              Icons.chevron_right,
              false,
              _showRightButton,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAnimatedScrollButton(
    final IconData icon,
    final bool isLeft,
    final bool visible,
  ) => Positioned(
    left: isLeft ? 0 : null,
    right: isLeft ? null : 0,
    top: 0,
    bottom: 0,
    child: IgnorePointer(
      ignoring: !visible,
      child: AnimatedOpacity(
        opacity: visible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 200),
        child: _buildScrollButton(icon, isLeft),
      ),
    ),
  );

  Widget _buildScrollButton(final IconData icon, final bool isLeft) => SizedBox(
    width: 64,
    child: Align(
      alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
      child: IconButton(
        onPressed: () => _scroll(
          (isLeft ? -1 : 1) *
              _scrollController.position.viewportDimension *
              0.8,
        ),
        icon: Icon(icon),
        visualDensity: VisualDensity.compact,
        padding: EdgeInsets.zero,
        style: IconButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.surface,
          shape: const CircleBorder(),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: const Size(40, 40),
        ),
      ),
    ),
  );
}
