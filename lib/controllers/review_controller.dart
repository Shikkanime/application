import 'dart:async';

import 'package:application/controllers/shared_preferences_controller.dart';
import 'package:application/dtos/enums/config_property_key.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';

class ReviewController {
  static final ReviewController instance = ReviewController();

  Future<void> requestReview() async {
    final InAppReview inAppReview = InAppReview.instance;

    if (!await inAppReview.isAvailable()) {
      debugPrint('In-app review is not available.');
      return;
    }

    final int reviewAppLaunched =
        (SharedPreferencesController.instance.getInt(
              ConfigPropertyKey.reviewAppLaunched,
            ) ??
            0) +
        1;
    await SharedPreferencesController.instance.setInt(
      ConfigPropertyKey.reviewAppLaunched,
      reviewAppLaunched,
    );

    if (reviewAppLaunched < 3 || reviewAppLaunched % 3 != 0) {
      debugPrint('Review app launched: $reviewAppLaunched');
      return;
    }

    await inAppReview.requestReview();
  }
}
