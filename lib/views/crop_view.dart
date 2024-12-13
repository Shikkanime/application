import 'dart:typed_data';

import 'package:application/controllers/member_controller.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          child: Padding(
            padding: const EdgeInsets.all(8),
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
                  ),
                ),
                ElevatedButton(
                  onPressed: controller.crop,
                  child: Text(AppLocalizations.of(context)!.save),
                ),
              ],
            ),
          ),
        ),
      );
}
