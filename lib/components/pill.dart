import 'package:application/utils/constant.dart';
import 'package:flutter/material.dart';

class Pill extends StatelessWidget {
  const Pill({required this.count, super.key});

  final int count;

  @override
  Widget build(final BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
    decoration: const BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.all(Radius.circular(Constant.borderRadius)),
    ),
    child: Text(
      count >= 10 ? '9+' : count.toString(),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    ),
  );
}
