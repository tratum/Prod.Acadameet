import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InPersonTab extends StatefulWidget {
  const InPersonTab({super.key});

  @override
  State<InPersonTab> createState() => _InPersonTabState();
}

class _InPersonTabState extends State<InPersonTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(right: 8, left: 8),
            itemCount: 3,
            itemBuilder: (context, index) {
              return const Column(
                children: [
                  // verticalSpaceLarge,
                  // Row(
                  //   children: [
                  //     Spacer(),
                  //     MeetingCard1(),
                  //   ],
                  // ),
                  // verticalSpaceLarge,
                  // Row(
                  //   children: [
                  //     MeetingCard2(),
                  //     Spacer(),
                  //   ],
                  // ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
