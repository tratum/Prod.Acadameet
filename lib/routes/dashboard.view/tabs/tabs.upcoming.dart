import 'package:acadameet/app/app.common.widgets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../app/app.common.functions.dart';
import '../../../app/app.constants.dart';
import '../../../config/firebase/function.firestore.dart';

class UpcomingTab extends StatelessWidget {
  const UpcomingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: fetchUpcomingUserEvents(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('-------------------------Error: ${snapshot.error}');
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Lottie.network(
              "https://tratum.github.io/cloud-asset-storage/lottie/no-meeting.json",
              repeat: true,
              height: 500,
              width: 500,
              fit: BoxFit.contain,
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Lottie.network(
              "https://tratum.github.io/cloud-asset-storage/lottie/no-meeting.json",
              repeat: true,
              height: 500,
              width: 500,
              fit: BoxFit.contain,
            ),
          );
        }
        final meetings = snapshot.data!;
        return ListView.builder(
          itemCount: meetings.length,
          itemBuilder: (context, index) {
            final data = meetings[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                meetingCard(
                  context,
                  data['subject'],
                  data['eventDate'],
                  data['eventTime'],
                  getCurrentUser()?.email ?? "",
                  data['recipient'],
                ),
                verticalSpaceLarge,
              ],
            );
          },
        );
      },
    );
    //   ListView.builder(
    //   itemCount: 10,
    //   itemBuilder: (BuildContext context, int index) {
    //     return Container(
    //       width: 300,
    //       height: 400,
    //       color: Colors.redAccent,
    //       margin: const EdgeInsets.only(right: 40, top: 20, bottom: 20),
    //     );
    //   },
    // );
  }
}
