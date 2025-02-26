import 'package:application/utils/constant.dart';
import 'package:flutter/material.dart';

class GenericLoader extends StatelessWidget {
  const GenericLoader({super.key, this.borderRadius});

  final double? borderRadius;

  @override
  Widget build(final BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius ?? Constant.borderRadius),
      ),
    ),
  );
}
