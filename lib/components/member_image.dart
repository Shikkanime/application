import 'package:application/components/image_component.dart';
import 'package:application/controllers/member_controller.dart';
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

  @override
  Widget build(final BuildContext context) {
    final DecoratedBox defaultMemberImage = DecoratedBox(
      decoration: BoxDecoration(color: Theme.of(context).canvasColor),
      child: const Icon(Icons.person, size: 24),
    );

    return Container(
      decoration:
          hasBorder
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
      padding: hasBorder ? const EdgeInsets.all(1) : null,
      child:
          member!.hasProfilePicture
              ? ImageComponent(
                uuid: member!.uuid,
                version: MemberController.instance.imageVersion.toString(),
                borderRadius: const BorderRadius.all(Radius.circular(360)),
                width: hasBorder && width != null ? width! - 6 : width,
                height: hasBorder && height != null ? height! - 6 : height,
                placeholder: const Padding(
                  padding: EdgeInsets.all(24),
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                errorWidget: defaultMemberImage,
              )
              : ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(360)),
                child: SizedBox(
                  width: hasBorder && width != null ? width! - 6 : width,
                  height: hasBorder && height != null ? height! - 6 : height,
                  child: defaultMemberImage,
                ),
              ),
    );
  }
}
