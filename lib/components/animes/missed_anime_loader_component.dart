import 'package:application/utils/constant.dart';
import 'package:flutter/material.dart';

class MissedAnimeLoaderComponent extends StatelessWidget {
  const MissedAnimeLoaderComponent({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => const SizedBox(
        width: 100,
        child: Column(
          spacing: 8,
          children: <Widget>[
            SizedBox(
              width: 80,
              height: 80,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(360),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: SizedBox(
                width: 75,
                height: 11,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        Constant.borderRadius,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
