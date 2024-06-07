import 'package:flutter/material.dart';

import '../commons/ui_helpers.dart';

class Skelton extends StatelessWidget {
  const Skelton({
    super.key,
    this.height,
    this.width,
    required this.borderRadius,
  });

  final double? height, width;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: const Color(0XFF1E1E1E).withOpacity(0.3),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
    );
  }
}

class MeetingCardSkelton extends StatelessWidget {
  const MeetingCardSkelton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 8, left: 8),
      child: Column(children: [
        verticalSpaceLarge,
        Row(
          children: [
            Spacer(),
            Skelton(
              height: 190,
              width: 320,
              borderRadius: 30,
            ),
          ],
        ),
        verticalSpaceLarge,
        Row(
          children: [
            Skelton(
              height: 40,
              width: 320,
              borderRadius: 30,
            ),
            Spacer(),
          ],
        ),
      ]),
    );
  }
}
