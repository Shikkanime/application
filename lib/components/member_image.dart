import 'package:application/components/generic_loader.dart';
import 'package:application/components/image_component.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/enums/image_type.dart';
import 'package:application/dtos/member_dto.dart';
import 'package:flutter/material.dart';

class MemberImage extends StatelessWidget {
  const MemberImage({
    required this.member,
    super.key,
    this.width,
    this.height,
    this.hasBorder = true,
  });

  final MemberDto? member;
  final double? width;
  final double? height;
  final bool hasBorder;

  static const double _borderWidth = 2;
  static const double _paddingWidth = 1;
  static const double _totalOffset = (_borderWidth + _paddingWidth) * 2;
  static const BorderRadius _borderRadius = BorderRadius.all(
    Radius.circular(360),
  );

  @override
  Widget build(final BuildContext context) {
    final double? innerWidth = _getInnerDimension(width);
    final double? innerHeight = _getInnerDimension(height);

    return Container(
      decoration: hasBorder ? _buildBorderDecoration(context) : null,
      padding: hasBorder ? const EdgeInsets.all(_paddingWidth) : null,
      child: _buildContent(innerWidth, innerHeight),
    );
  }

  double? _getInnerDimension(final double? size) {
    if (hasBorder && size != null) {
      return size - _totalOffset;
    }
    return size;
  }

  BoxDecoration _buildBorderDecoration(final BuildContext context) =>
      BoxDecoration(
        shape: BoxShape.circle,
        border: Border.fromBorderSide(
          BorderSide(
            color: Theme.of(context).textTheme.titleLarge!.color!,
            width: _borderWidth,
          ),
        ),
      );

  Widget _buildContent(final double? w, final double? h) {
    if (MemberController.instance.isImageUploadLoading) {
      return GenericLoader(borderRadius: 360, width: w, height: h);
    }

    final String? lastUpdate = member?.attachmentLastUpdateDateTime;

    if (member != null && lastUpdate != null) {
      return ImageComponent(
        uuid: member!.uuid,
        type: ImageType.memberProfile,
        version: DateTime.parse(lastUpdate).millisecondsSinceEpoch.toString(),
        borderRadius: _borderRadius,
        width: w,
        height: h,
      );
    }

    return ClipRRect(
      borderRadius: _borderRadius,
      child: SizedBox(width: w, height: h, child: const _PlaceholderImage()),
    );
  }
}

class _PlaceholderImage extends StatelessWidget {
  const _PlaceholderImage();

  @override
  Widget build(final BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(color: Theme.of(context).canvasColor),
    child: const Icon(Icons.person, size: 24),
  );
}
