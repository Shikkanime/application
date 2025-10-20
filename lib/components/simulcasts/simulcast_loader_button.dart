import 'package:application/components/generic_loader.dart';
import 'package:flutter/material.dart';

class SimulcastLoaderButton extends StatelessWidget {
  const SimulcastLoaderButton({super.key});

  @override
  Widget build(final BuildContext context) => const Padding(
    padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
    child: Row(children: <Widget>[GenericLoader(width: 150, height: 30)]),
  );
}
