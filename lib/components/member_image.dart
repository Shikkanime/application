import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/member_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MemberImage extends StatelessWidget {
  final MemberDto? member;
  final double? width;
  final double? height;
  final bool hasBorder;

  const MemberImage({
    super.key,
    required this.member,
    this.width,
    this.height,
    this.hasBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    final showDefaultImage = member?.hasProfilePicture == false;
    final defaultImage = DecoratedBox(
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
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => defaultImage,
              ),
      ),
    );
  }
}
