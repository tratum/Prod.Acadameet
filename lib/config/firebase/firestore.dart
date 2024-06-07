import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../keys/keys.dart';
import '../microsoft/microsoft_functions.dart';

class Database {
  static void storeAuthData({
    required String id,
    required String displayName,
    required String fName,
    required String lName,
    required String mail,
    required String bPhone,
  }) {
    final FirebaseFirestore store = FirebaseFirestore.instance;

    store.collection('UserAuthData').doc(fName + lName + id).set(
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

  static void sendMeetingData({
    required String name,
    required String desc,
    required String institute,
    required String workMail,
    required String meetingType,
    required String priority,
    required String scheduleDate,
    required String scheduleTime,
  }) async {
    final String? id = await getUID();
    final String? uName = await getUserName();
    if (id != null && uName != null) {
      final mData = <String, dynamic>{
        "uID": id,
        "name": name,
        "description": desc,
        "institution": institute,
        "workMail": workMail,
        "meetingType": meetingType,
        "priority": priority,
        "schedulingDate": scheduleDate,
        "schedulingTime": scheduleTime,
        "TimeStamp": Timestamp.now(),
        "secretKey": "Xgyc0Ses01KGS06GhTHO1njNmB3i9SMcWPTjkoUKgtvPWWtiY7",
      };
      final FirebaseFirestore store = FirebaseFirestore.instance;
      final DocumentReference docRef =
          store.collection('MeetingData').doc(uName + id).collection(id).doc();
      mData['docID'] = docRef.id;
      await docRef.set(mData).catchError((error) {
        throw Exception(
            "-------------------------------------------------------Uploading data failed: $error");
      });
    } else {
      throw Exception(
          "---------------------------------------------------------Uploading Data Failed");
    }
  }

  static Future<List<QueryDocumentSnapshot<Object?>>> getMeetings() async {
    final String? id = await getUID();
    final String? uName = await getUserName();
    if (id != null && uName != null) {
      final snapshot = await FirebaseFirestore.instance
          .collection('MeetingData')
          .doc(uName + id)
          .collection(id)
          .get();
      return snapshot.docs;
    } else {
      throw Exception("ID is Null");
    }
  }
}
