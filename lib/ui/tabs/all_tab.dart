import 'package:acadameet/config/firebase/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../commons/m_card_skelton.dart';
import '../../commons/ui_helpers.dart';
import '../card/m_card_type1.dart';
import '../card/m_card_type2.dart';

class AllTab extends StatefulWidget {
  const AllTab({super.key});

  @override
  State<AllTab> createState() => _AllTabState();
}

class _AllTabState extends State<AllTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: FutureBuilder<List<DocumentSnapshot<Object?>>>(
            future: Database.getMeetings(),
            builder: (BuildContext context,
                AsyncSnapshot<List<DocumentSnapshot<Object?>>> snapshot) {
              if (snapshot.hasError) {
                debugPrint("--------------------error: ${snapshot.error}");
                return Text('Error: ${snapshot.error}');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const MeetingCardSkelton();
              }
              final data = snapshot.data ?? [];
              if (data.isEmpty) {
                return Lottie.network(
                  "https://tratum.github.io/cloud-asset-storage/lottie/laptop-closing.json",
                  fit: BoxFit.contain,
                  height: 220,
                  width: 360,
                  backgroundLoading: true,
                  alignment: Alignment.center,
                  frameRate: const FrameRate(50),
                  animate: true,
                  repeat: true,
                  reverse: true,
                );
              }
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic>? mData =
                      data[index].data() as Map<String, dynamic>?;
                  if (index % 2 == 0) {
                    return Column(
                      children: [
                        verticalSpaceLarge,
                        Row(
                          children: [
                            const Spacer(),
                            MeetingCard1(
                              institution: mData?['institution'],
                              scheduledDate: mData?['schedulingDate'],
                              scheduledTime: mData?['schedulingTime'],
                              name: mData?['name'],
                              docID: mData?['docID'],
                            ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        verticalSpaceLarge,
                        Row(
                          children: [
                            MeetingCard2(
                              institution: mData?['institution'],
                              scheduledDate: mData?['schedulingDate'],
                              scheduledTime: mData?['schedulingTime'],
                              name: mData?['name'],
                              docID: mData?['docID'],
                            ),
                            const Spacer(),
                          ],
                        ),
                      ],
                    );
                  }
                  return Column(
                    children: [
                      verticalSpaceLarge,
                      Row(
                        children: [
                          const Spacer(),
                          MeetingCard1(
                            institution: mData?['institution'],
                            scheduledDate: mData?['schedulingDate'],
                            scheduledTime: mData?['schedulingTime'],
                            name: mData?['name'],
                            docID: mData?['docID'],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
        // Expanded(
        //   child: ListView.builder(
        //     padding: const EdgeInsets.only(right: 8, left: 8),
        //     itemCount: 3,
        //     itemBuilder: (context, index) {
        //       return const Column(
        //         children: [
        //           verticalSpaceLarge,
        //           Row(
        //             children: [
        //               Spacer(),
        //               MeetingCard1(),
        //             ],
        //           ),
        //           verticalSpaceLarge,
        //           Row(
        //             children: [
        //               MeetingCard2(),
        //               Spacer(),
        //             ],
        //           ),
        //         ],
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }
}
