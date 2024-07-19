import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../config/firebase/db.firestore.dart';
import '../config/google/functions.google.dart';

String? getCurrentUID() {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    return user.uid;
  } else {
    return null;
  }
}

User? getCurrentUser() {
  return FirebaseAuth.instance.currentUser;
}

class AuthenticationProvider with ChangeNotifier {
  UserCredential? _userState;

  UserCredential? get userState => _userState;

  void googleUserStateNotifier(UserCredential? state) {
    _userState = state;
    notifyListeners();
  }
}

String formatDate(DateTime date) {
  String daySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  String month = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ][date.month - 1];

  return '${date.day}${daySuffix(date.day)} $month, ${date.year}';
}

String formatTime(TimeOfDay timeOfDay) {
  return DateFormat.jm().format(DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      timeOfDay.hour,
      timeOfDay.minute));
}

Future<String?> meetingDataHandler({
  required String accessToken,
  required BuildContext context,
  required String recipient,
  required String emailSubject,
  required String emailBody,
  required String emailDate,
  required String emailTime,
  String? meetingSummary,
  String? meetingDate,
  String? meetingTime,
  int? meetingDuration,
}) async {
  emailBody = emailBody.replaceAll(RegExp(r'\n\s*\n'), '\n\n');
  if (meetingSummary != null &&
      meetingDate != null &&
      meetingTime != null &&
      meetingDuration != null) {
    final videoEventTime =
        TimeOfDay.fromDateTime(DateFormat.jm().parse(meetingTime));
    final videoEventDate = DateFormat('dd MMMM, yyyy', 'en_US')
        .parse(meetingDate.replaceAll(RegExp(r'(?<=\d)(st|nd|rd|th)'), ''))
        .toUtc();
    final videoEventTimeStamp = DateTime(
            videoEventDate.year,
            videoEventDate.month,
            videoEventDate.day,
            videoEventTime.hour,
            videoEventTime.minute)
        .toUtc();
    final meetLink = await createGoogleMeetLink(
        recipient,
        context,
        meetingSummary,
        videoEventTimeStamp,
        videoEventTimeStamp.add(Duration(minutes: meetingDuration)),
        accessToken);
    final mailID = await sendEmailWithMeeting(recipient, emailSubject,
        emailBody, meetingDate, meetingTime, meetLink, accessToken);
    Database.syncMeetings(
      subject: emailSubject,
      recipient: recipient,
      body: emailBody,
      eventDate: emailDate,
      eventTime: emailTime,
      attendees: [
        getCurrentUser()?.email ?? "",
        recipient,
      ],
      videoEventSummary: meetingSummary,
      videoEventLink: meetLink,
      videoEventDate: meetingDate,
      videoEventTime: meetingTime,
      meetDuration: meetingDuration,
      eventTimeStamp: videoEventTimeStamp,
      videoEventTimeStamp: videoEventTimeStamp,
    );
    return mailID;
  }
  if (meetingSummary == null &&
      meetingDate == null &&
      meetingTime == null &&
      meetingDuration == null) {
    final eventTime = TimeOfDay.fromDateTime(DateFormat.jm().parse(emailTime));
    final eventDate = DateFormat('dd MMMM, yyyy', 'en_US')
        .parse(emailDate.replaceAll(RegExp(r'(?<=\d)(st|nd|rd|th)'), ''))
        .toUtc();
    final eventTimeStamp = DateTime(eventDate.year, eventDate.month,
            eventDate.day, eventTime.hour, eventTime.minute)
        .toUtc();
    final mailID = await sendEmail(
        recipient, emailSubject, emailBody, emailDate, emailTime, accessToken);
    Database.syncMeetings(
      subject: emailSubject,
      recipient: recipient,
      body: emailBody,
      eventDate: emailDate,
      eventTime: emailTime,
      attendees: [
        getCurrentUser()?.email ?? "",
        recipient,
      ],
      eventTimeStamp: eventTimeStamp,
    );
    return mailID;
  } else {
    return null;
  }
}
