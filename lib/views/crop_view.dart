import 'dart:typed_data';

import 'package:application/controllers/member_controller.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CropView extends StatelessWidget {
  final Uint8List bytes;
  final CropController controller;

  const CropView({
    super.key,
    required this.bytes,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(AppLocalizations.of(context)!.crop),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Crop(
                controller: controller,
                image: bytes,
                withCircleUi: true,
                baseColor: Theme.of(context).scaffoldBackgroundColor,
                onCropped: (value) {
                  Navigator.of(context).pop();
                  MemberController.instance.updateImage(value);
                },
              ),
            ),
            // Rotate button
            ElevatedButton(
              onPressed: controller.crop,
              child: Text(AppLocalizations.of(context)!.save),
            ),
          ],
        ),
      ),
    );
  }
}
