import 'package:application/components/card_component.dart';
import 'package:application/utils/constant.dart';
import 'package:flutter/material.dart';

class EpisodeLoaderComponent extends StatelessWidget {
  const EpisodeLoaderComponent({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    const DecoratedBox decoratedBox = DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(Constant.borderRadius),
        ),
      ),
    );

    return const SizedBox(
      width: double.infinity,
      child: CustomCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 200,
              child: decoratedBox,
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 200,
              height: 20,
              child: decoratedBox,
            ),
            SizedBox(height: 8),
            SizedBox(
              width: 150,
              height: 14,
              child: decoratedBox,
            ),
            SizedBox(height: 8),
            SizedBox(
              width: 100,
              height: 14,
              child: decoratedBox,
            ),
            SizedBox(height: 14),
            Flex(
              direction: Axis.horizontal,
              spacing: 8,
              children: <Widget>[
                SizedBox(
                  width: 125,
                  height: 24,
                  child: decoratedBox,
                ),
                SizedBox(
                  width: 125,
                  height: 24,
                  child: decoratedBox,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
