import 'package:application/components/card_component.dart';
import 'package:application/components/generic_loader.dart';
import 'package:flutter/material.dart';

class CalendarAnimeLoaderComponent extends StatelessWidget {
  const CalendarAnimeLoaderComponent({super.key});

  @override
  Widget build(final BuildContext context) => const CustomCard(
        child: Column(
          spacing: 8,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 185,
              child: GenericLoader(),
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 50,
                    height: 15,
                    child: GenericLoader(),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: VerticalDivider(thickness: 0.5),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          width: 175,
                          height: 20,
                          child: GenericLoader(),
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          width: 100,
                          height: 15,
                          child: GenericLoader(),
                        ),
                        SizedBox(height: 14),
                        SizedBox(
                          width: 75,
                          height: 25,
                          child: GenericLoader(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
