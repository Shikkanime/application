import 'dart:typed_data';

import 'package:application/controllers/member_controller.dart';
import 'package:application/l10n/generated/app_localizations.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';

class CropView extends StatelessWidget {
  const CropView({
    required this.bytes,
    required this.controller,
    super.key,
  });

  final Uint8List bytes;
  final CropController controller;

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(AppLocalizations.of(context)!.crop),
        ),
        body: SafeArea(
          child: Column(
            spacing: 16,
            children: <Widget>[
              Expanded(
                child: Crop(
                  controller: controller,
                  image: bytes,
                  withCircleUi: true,
                  baseColor: Theme.of(context).scaffoldBackgroundColor,
                  filterQuality: FilterQuality.high,
                  onCropped: (final CropResult result) {
                    switch (result) {
                      case CropSuccess(:final Uint8List croppedImage):
                        Navigator.of(context).pop();
                        MemberController.instance.updateImage(croppedImage);
                      case CropFailure():
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Failed to crop image'),
                          ),
                        );
                    }
                  },
                  clipBehavior: Clip.none,
                  interactive: true,
                  fixCropRect: true,
                  cornerDotBuilder: (
                    final double size,
                    final EdgeAlignment edgeAlignment,
                  ) =>
                      const SizedBox(),
                ),
              ),
              ElevatedButton(
                onPressed: controller.crop,
                child: Text(AppLocalizations.of(context)!.save),
              ),
            ],
          ),
        ),
      );
}
