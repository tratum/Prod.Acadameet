import 'package:cloud_firestore/cloud_firestore.dart';
import '../../app/app.common.functions.dart';

Stream<List<Map<String, dynamic>>> fetchUpcomingUserEvents() {
  String? email = getCurrentUser()?.email;
  if (email == null) {
    throw Exception("No user signed in");
  }

  final userMeetingsRef = FirebaseFirestore.instance.collection('userMeetings');
  DateTime now = DateTime.now().toUtc();

  return userMeetingsRef
      .where('userMail', isEqualTo: email)
      .snapshots()
      .asyncMap((snapshot) async {
    List<Map<String, dynamic>> meetings = [];

    for (var doc in snapshot.docs) {
      var meetingId = doc['meetingId'];
      var meetingSnapshot = await FirebaseFirestore.instance
          .collection('meetings')
          .doc(meetingId)
          .get();
      if (meetingSnapshot.exists) {
        var meetingData = meetingSnapshot.data()!;
        meetingData['role'] = doc['role'];
        meetingData['status'] = doc['status'];

        DateTime combinedDateTime =
            (meetingData['eventTimeStamp'] as Timestamp).toDate();
        if (combinedDateTime.isBefore(now.subtract(const Duration(days: 1)))) {
          // Adjusted for 1 day old
          meetings.add(meetingData);
        }
      }
    }
    meetings.sort((a, b) {
      DateTime dateTimeA = (a['eventTimeStamp'] as Timestamp).toDate();
      DateTime dateTimeB = (b['eventTimeStamp'] as Timestamp).toDate();
      return dateTimeB.compareTo(dateTimeA); // Descending order for past events
    });

    return meetings;
  });
}

// Stream<List<Map<String, dynamic>>> fetchUserMeetings() {
//   String? email = getCurrentUser()?.email;
//   if (email == null) {
//     throw Exception("No user signed in");
//   }
//   final userMeetingsRef = FirebaseFirestore.instance.collection('userMeetings');
//   return userMeetingsRef
//       .where('userMail', isEqualTo: email)
//       .orderBy('createdAt', descending: true)
//       .snapshots()
//       .asyncMap((snapshot) async {
//     List<Map<String, dynamic>> meetings = [];
//     for (var doc in snapshot.docs) {
//       var meetingId = doc['meetingId'];
//       var meetingSnapshot = await FirebaseFirestore.instance
//           .collection('meetings')
//           .doc(meetingId)
//           .get();
//       if (meetingSnapshot.exists) {
//         var meetingData = meetingSnapshot.data()!;
//         meetingData['role'] = doc['role'];
//         meetingData['status'] = doc['status'];
//         meetings.add(meetingData);
//       }
//     }
//     return meetings;
//   });
// }

// Stream<List<Map<String, dynamic>>> fetchUpcomingUserEvents() {
//   String? email = getCurrentUser()?.email;
//   if (email == null) {
//     throw Exception("No user signed in");
//   }
//
//   final userMeetingsRef = FirebaseFirestore.instance.collection('userMeetings');
//   DateTime now = DateTime.now().toUtc();
//
//   return userMeetingsRef
//       .where('userMail', isEqualTo: email)
//       .snapshots()
//       .asyncMap((snapshot) async {
//     List<Map<String, dynamic>> meetings = [];
//
//     for (var doc in snapshot.docs) {
//       var meetingId = doc['meetingId'];
//       var meetingSnapshot = await FirebaseFirestore.instance
//           .collection('meetings')
//           .doc(meetingId)
//           .get();
//       if (meetingSnapshot.exists) {
//         var meetingData = meetingSnapshot.data()!;
//         meetingData['role'] = doc['role'];
//         meetingData['status'] = doc['status'];
//
//         DateTime combinedDateTime = (meetingData['eventTimeStamp'] as Timestamp).toDate();
//         if (combinedDateTime.isAfter(now)) { // Change to isAfter for upcoming events
//           meetings.add(meetingData);
//         }
//       }
//     }
//     meetings.sort((a, b) {
//       DateTime dateTimeA = (a['eventTimeStamp'] as Timestamp).toDate();
//       DateTime dateTimeB = (b['eventTimeStamp'] as Timestamp).toDate();
//       return dateTimeA.compareTo(dateTimeB); // Ascending order for upcoming events
//     });
//
//     return meetings;
//   });
// }
