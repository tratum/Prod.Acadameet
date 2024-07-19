import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis/gmail/v1.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart' as provider;

import '../../app/app.common.functions.dart';

const storage = FlutterSecureStorage();

Future<void> saveGToken(String? accessToken) async {
  await storage.write(key: 'g_access_token', value: accessToken);
}

Future<String?> getGToken() async {
  var key = await storage.read(key: 'g_access_token');
  if (key!.isNotEmpty) {
    return key;
  } else {
    return null;
  }
}

Message createEmail(String to, String from, String subject, String body) {
  final headers = <String, String>{
    'To': to,
    'From': from,
    'Subject': subject,
  };

  final email = StringBuffer();
  headers.forEach((key, value) {
    email.write('$key: $value\r\n');
  });
  email.write('\r\n$body');

  final bytes = utf8.encode(email.toString());
  final base64Bytes = base64Url.encode(Uint8List.fromList(bytes));
  final message = Message()..raw = base64Bytes;
  return message;
}

Future<String?> sendEmail(String recipient, String subject, String body,
    String emailDate, String emailTime, String accessToken) async {
  try {
    final client = authenticatedClient(
      Client(),
      AccessCredentials(
        AccessToken('Bearer', accessToken,
            DateTime.now().add(const Duration(hours: 1)).toUtc()),
        null,
        ['https://www.googleapis.com/auth/gmail.send'],
      ),
    );
    final emailBody = '''
$body

Meeting Details:
  Date: $emailDate
  Time: $emailTime
  Meeting Type: Physical Meeting    

This is an automated notification from Acadameet, a web application facilitating appointments between students and faculty members.

To learn more about our service and explore additional features, please visit our website: https://acadameet.tratum.dev/

Best regards,
The Acadameet Team
    ''';

    final gmailApi = GmailApi(client);
    final email = createEmail(recipient, 'me', subject, emailBody);
    final response = await gmailApi.users.messages.send(email, 'me');
    // log('Email sent successfully: ${response.id}');
    return response.id;
  } catch (e) {
    throw Exception('Error sending email: $e');
  }
}

Future<String?> sendEmailWithMeeting(
  String recipient,
  String subject,
  String body,
  String meetingDate,
  String meetingTime,
  String meetingLink,
  String accessToken,
) async {
  try {
    final client = authenticatedClient(
      Client(),
      AccessCredentials(
        AccessToken('Bearer', accessToken,
            DateTime.now().add(const Duration(hours: 1)).toUtc()),
        null,
        ['https://www.googleapis.com/auth/gmail.send'],
      ),
    );
    final emailBody = '''
$body

Meeting Details:
  Date: $meetingDate
  Time: $meetingTime
  Meeting Type: Video Meeting

Meeting Link: $meetingLink
      
This is an automated notification from Acadameet, a web application facilitating appointments between students and faculty members.

To learn more about our service and explore additional features, please visit our website: https://acadameet.tratum.dev/

Best regards,
The Acadameet Team
    ''';
    final gmailApi = GmailApi(client);
    final email = createEmail(recipient, 'me', subject, emailBody);
    final response = await gmailApi.users.messages.send(email, 'me');
    // log('Email sent successfully: ${response.id}');
    return response.id;
  } catch (e) {
    throw Exception('Error sending email: $e');
  }
}

Future<String> createGoogleMeetLink(String recipientEmail, BuildContext context,
    String summary, DateTime start, DateTime end, String accessToken) async {
  final userState =
      provider.Provider.of<AuthenticationProvider>(context).userState;
  try {
    final client = authenticatedClient(
      Client(),
      AccessCredentials(
        AccessToken('Bearer', accessToken,
            DateTime.now().add(const Duration(hours: 1)).toUtc()),
        null,
        ['https://www.googleapis.com/auth/calendar.events'],
      ),
    );
    final calendarApi = CalendarApi(client);
    final event = Event(
      summary: summary,
      start: EventDateTime(
        dateTime: start,
        timeZone: 'GMT',
      ),
      end: EventDateTime(
        dateTime: end,
        timeZone: 'GMT',
      ),
      attendees: [
        EventAttendee(email: recipientEmail),
        EventAttendee(email: userState?.user?.email)
      ],
      creator: EventCreator(displayName: "Acadameet"),
      organizer: EventOrganizer(displayName: "Acadameet"),
      guestsCanSeeOtherGuests: true,
      guestsCanInviteOthers: true,
      conferenceData: ConferenceData(
        createRequest: CreateConferenceRequest(
          requestId: '945360',
          conferenceSolutionKey: ConferenceSolutionKey(
            type: 'hangoutsMeet',
          ),
        ),
      ),
    );

    final createdEvent = await calendarApi.events
        .insert(event, 'primary', conferenceDataVersion: 1, sendUpdates: "all");
    final meetLink = createdEvent.conferenceData?.entryPoints?.first.uri ?? '';
    return meetLink;
  } catch (e) {
    throw Exception('Error creating Google Meet link: $e');
  }
}
