import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/member_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
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

  @override
  Widget build(final BuildContext context) {
    final bool showDefaultImage = member?.hasProfilePicture == false;
    final DecoratedBox defaultImage = DecoratedBox(
      decoration: BoxDecoration(color: Theme.of(context).canvasColor),
      child: const Icon(
        Icons.person,
        size: 32,
      ),
    );

    return Container(
      decoration: hasBorder
          ? BoxDecoration(
              shape: BoxShape.circle,
              border: Border.fromBorderSide(
                BorderSide(
                  color: Theme.of(context).textTheme.titleLarge!.color!,
                  width: 2,
                ),
              ),
            )
          : null,
      padding: const EdgeInsets.all(1),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(360)),
        child: showDefaultImage
            ? defaultImage
            : CachedNetworkImage(
                width: width,
                height: height,
                imageUrl:
                    '${Constant.apiUrl}/v1/attachments?uuid=${member?.uuid}&v=${MemberController.instance.imageVersion}',
                filterQuality: FilterQuality.high,
                placeholder: (final BuildContext context, final String url) =>
                    const Padding(
                  padding: EdgeInsets.all(24),
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
                errorWidget: (
                  final BuildContext context,
                  final String url,
                  final Object error,
                ) =>
                    defaultImage,
              ),
      ),
    );
  }
}
