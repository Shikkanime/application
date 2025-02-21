import 'package:application/utils/constant.dart';
import 'package:flutter/material.dart';

class GenericLoader extends StatelessWidget {
  const GenericLoader({super.key});

  @override
  Widget build(final BuildContext context) => const DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(
            Radius.circular(Constant.borderRadius),
          ),
        ),
      );
}
