// const storage = FlutterSecureStorage();
// final dio = Dio();
//
// Future<void> saveAccessToken(String? accessToken) async {
//   await storage.write(key: 'access_token', value: accessToken);
// }

// Future<bool?> authIDSwitch() async {
//   var sKey = await storage.read(key: 'user_auth_id');
//   if (sKey!.isNotEmpty) {
//     return true;
//   } else if (sKey.isEmpty) {
//     return false;
//   } else {
//     return null;
//   }
// }
//
// Future<void> saveIDToken(String? idToken) async {
//   await storage.write(key: 'id_token', value: idToken);
// }
//
// Future<void> deleteAccessToken() async {
//   await storage.delete(key: 'access_token');
// }
//
// Future<void> deleteIDToken() async {
//   await storage.delete(key: 'id_token');
// }

// Future<void> microsoftSignIn() async {
//   try {
//     await signIn();
//   } catch (e) {
//     log('Error during sign-in: $e');
//   }
// }
//
// Future<String> getAuthToken() async {
//   try {
//     var token = await getToken();
//     return token;
//   } catch (e) {
//     log('Error getting token: $e');
//     rethrow;
//   }
// }
//
// Future<void> saveUID(String authID) async {
//   await storage.write(key: 'user_auth_id', value: authID);
// }
//
// Future<String?> getUID() async {
//   var key = await storage.read(key: 'user_auth_id');
//   if (key!.isNotEmpty) {
//     return key;
//   } else {
//     return null;
//   }
// }
//
// Future<void> saveUserName(String authID) async {
//   await storage.write(key: 'user_name', value: authID);
// }
//
// Future<String?> getUserName() async {
//   var key = await storage.read(key: 'user_name');
//   if (key!.isNotEmpty) {
//     return key;
//   } else {
//     return null;
//   }
// }
//
// Future<void> authUserDataHandler() async {
//   final accessToken = await storage.read(key: 'access_token');
//   final response = await dio.get(
//     'https://graph.microsoft.com/v1.0/me',
//     options: Options(headers: {
//       'Authorization': 'Bearer $accessToken',
//     }),
//   );
//   if (response.statusCode == 200) {
//     // Handle the response
//     // debugPrint('-------------Response body: ${response.data}');
//     saveUID(response.data['id']);
//     saveUserName(response.data['givenName'] + response.data['surname']);
//     Database.storeAuthData(
//       id: response.data['id'],
//       displayName: response.data['displayName'],
//       fName: response.data['givenName'],
//       lName: response.data['surname'],
//       mail: response.data['mail'],
//       bPhone: response.data['businessPhones'][0],
//     );
//     locator<RouterService>().navigateToDashboardView;
//   } else {
//     log('Request failed with status: ${response.statusCode}, ${response.statusMessage} and ${response.headers}.');
//   }
// }
//
// Future<void> createMail(String recipientMail) async {
//   final accessToken = await storage.read(key: 'access_token');
//   if (accessToken == null || accessToken.isEmpty) {
//     log("Access token is null or empty.");
//     return;
//   }
//   const String requestUrl = 'https://graph.microsoft.com/v1.0/me/sendMail';
//   String emailBody = '''
//      {
//     "message": {
//       "subject": "Hello from Flutter",
//       "body": {
//         "contentType": "Text",
//         "content": "Hello, this is a test email sent from a Flutter app."
//       },
//       "toRecipients": [
//         {
//           "emailAddress": {
//             "address": "$recipientMail"
//           }
//         }
//       ]
//     },
//     "saveToSentItems": "true"
//  }
// ''';
//
//   try {
//     final response = await Dio().post(
//       requestUrl,
//       options: Options(
//         headers: {
//           'Authorization': 'Bearer $accessToken',
//           'Content-Type': 'application/json',
//         },
//       ),
//       data: emailBody,
//     );
//
//     if (response.statusCode == 202) {
//       log("------------------------Mail Sent Successfully");
//     } else {
//       log("------------------------Mail Request Failed ${response.statusMessage}");
//     }
//   } catch (e) {
//     log("------------------------Error sending mail: $e");
//   }
// }
//
// Future<void> createEvent(String recipientMail) async {
//   final accessToken = await storage.read(key: 'access_token');
//   String eventBody = '''
//    {
//     "subject": "Flutter Event",
//     "body": {
//        "contentType": "Text",
//        "content": "This is a description of the event created from a Flutter app."
//     },
//     "start": {
//       "dateTime": "2023-04-15T14:00:00",
//       "timeZone": "Pacific Standard Time"
//     },
//     "end": {
//       "dateTime": "2023-04-15T15:00:00",
//       "timeZone": "Pacific Standard Time"
//     },
//     "location": {
//       "displayName": "Flutter Office"
//     },
//     "attendees": [
//       {
//         "emailAddress": {
//           "address": $recipientMail
//         },
//         "type": "required"
//       }
//     ]
//  }
//   ''';
//   if (accessToken == null || accessToken.isEmpty) {
//     log("Access token is null or empty.");
//     return;
//   }
//   const String url = 'https://graph.microsoft.com/v1.0/me/events';
//   try {
//     final response = await Dio().post(url,
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer $accessToken',
//             'Content-Type': 'application/json',
//           },
//         ),
//         data: eventBody);
//     if (response.statusCode == 201) {
//       log("------------------------Event Created Successfully");
//     } else {
//       debugPrint(
//           "------------------------Mail Request Failed ${response.statusMessage}");
//     }
//   } catch (e) {
//     log("------------------------Error Creating Event: $e");
//   }
// }
