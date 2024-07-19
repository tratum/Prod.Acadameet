import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../app/app.common.functions.dart';
import '../keys/keys.dart';

final db = FirebaseFirestore.instance;

class Database {
  static void storeAuthData({
    required String id,
    required String displayName,
    required String fName,
    required String lName,
    required String mail,
    required String bPhone,
  }) {
    db.collection('UserAuthData').doc(fName + lName + id).set(
      {
        "id": id,
        "name": "$fName $lName",
        "mail": mail,
        "businessPhone": bPhone,
        "branch":
            RegExp(r'\[([^\]]+)\]').firstMatch(displayName)?.group(1) ?? '',
        "secretKey": firebaseSecretKey,
      },
    ).onError((e, _) => debugPrint("Error writing document: $e"));
  }

  static void syncGoogleUser() {
    if (getCurrentUID() != null) {
      final userData = <String, dynamic>{
        "uid": getCurrentUID(),
        "name": getCurrentUser()?.displayName,
        "email": getCurrentUser()?.email,
        "joinedAt": Timestamp.now(),
        "secretKey": firebaseSecretKey,
      };
      db.collection('Users').doc(getCurrentUID()).set(userData).onError(
            (error, stackTrace) =>
                throw Exception("Error while Syncing User $error $stackTrace"),
          );
    } else {
      log("No User has Signed-In yet");
    }
  }

  static Future<void> syncMeetings({
    required String subject,
    required String recipient,
    required String body,
    required String eventDate,
    required String eventTime,
    required DateTime eventTimeStamp,
    required List<String> attendees,
    String? videoEventSummary,
    String? videoEventLink,
    String? videoEventDate,
    String? videoEventTime,
    DateTime? videoEventTimeStamp,
    int? meetDuration,
  }) async {
    String? uid = getCurrentUID();
    if (uid == null) {
      throw Exception("No user signed in");
    }
    final meetingData = <String, dynamic>{
      "subject": subject,
      "recipient": recipient,
      "body": body,
      "eventDate": eventDate,
      "eventTime": eventTime,
      "eventTimeStamp": eventTimeStamp,
      "eventSummary": videoEventSummary,
      "videoEventDate": videoEventDate,
      "videoEventTime": videoEventTime,
      "videoEventLink": videoEventLink,
      "videoEventTimeStamp": videoEventTimeStamp,
      "videoEventDurationInMinutes": meetDuration,
      "attendees": attendees,
      "createdBy": uid,
      "createdAt": Timestamp.now(),
      "secretKey": firebaseSecretKey,
    };

    final meetingDocRef = await db.collection('meetings').add(meetingData);

    for (int i = 0; i < attendees.length; i++) {
      String attendee = attendees[i];
      final userMeetingData = <String, dynamic>{
        "userMail": attendee,
        "meetingId": meetingDocRef.id,
        "role": i == 0 ? "organizer" : "participant",
        "status": "accepted",
        "secretKey": firebaseSecretKey,
      };
      await db.collection('userMeetings').add(userMeetingData);
    }
  }

// static void sendMeetingData({
//   required String name,
//   required String desc,
//   required String institute,
//   required String workMail,
//   required String meetingType,
//   required String priority,
//   required String scheduleDate,
//   required String scheduleTime,
// }) async {
//   final String? id = await getUID();
//   final String? uName = await getUserName();
//   if (id != null && uName != null) {
//     final mData = <String, dynamic>{
//       "uID": id,
//       "name": name,
//       "description": desc,
//       "institution": institute,
//       "workMail": workMail,
//       "meetingType": meetingType,
//       "priority": priority,
//       "schedulingDate": scheduleDate,
//       "schedulingTime": scheduleTime,
//       "TimeStamp": Timestamp.now(),
//       "secretKey": firebaseSecretKey,
//     };
//     final FirebaseFirestore store = FirebaseFirestore.instance;
//     final DocumentReference docRef =
//         store.collection('MeetingData').doc(uName + id).collection(id).doc();
//     mData['docID'] = docRef.id;
//     await docRef.set(mData).catchError((error) {
//       throw Exception(
//           "-------------------------------------------------------Uploading data failed: $error");
//     });
//   } else {
//     throw Exception(
//         "---------------------------------------------------------Uploading Data Failed");
//   }
// }

// static Future<List<QueryDocumentSnapshot<Object?>>> getMeetings() async {
//   final String? id = await getUID();
//   final String? uName = await getUserName();
//   if (id != null && uName != null) {
//     final snapshot = await FirebaseFirestore.instance
//         .collection('MeetingData')
//         .doc(uName + id)
//         .collection(id)
//         .get();
//     return snapshot.docs;
//   } else {
//     throw Exception("ID is Null");
//   }
// }
}
