// import 'package:aad_oauth/aad_oauth.dart';
// import 'package:aad_oauth/model/config.dart';

// final dio = Dio();
//
// class MicrosoftAuthHandler {
//   static final Config _config = Config(
//     tenant: microsoftTenant,
//     clientId: microsoftClientID,
//     scope: microsoftScopes,
//     navigatorKey: navigatorKey,
//     loader: const SizedBox(),
//     webUseRedirect: true,
//     redirectUri: microsoftRedirectUri,
//     // responseType: responseType,
//     // appBar: AppBar(
//     //   title: const Text(''),
//     // ),
//   );
//   static final AadOAuth oauth = AadOAuth(_config);
//
//   static Future<UserCredential?> handleSignIn() async {
//     const String authUrl =
//         '$microsoftAuthEndpoint?client_id=$microsoftClientID&response_type=$microsoftResponseType&redirect_uri=$microsoftRedirectUri&scope=$microsoftScopes';
//     final result = await http.get(Uri.parse(authUrl));
//     final Uri responseUri = Uri.parse(result.headers['location']!);
//     final String? code = responseUri.queryParameters['code'];
//     if (code == null) {
//       return null;
//     }
//     final response = await http.post(
//       Uri.parse(microsoftTokenEndpoint),
//       headers: {'Content-Type': 'application/x-www-form-urlencoded'},
//       body: {
//         'client_id': microsoftClientID,
//         'redirect_uri': microsoftRedirectUri,
//         'grant_type': 'authorization_code',
//         'code': code,
//         'scope': microsoftScopes,
//       },
//     );
//
//     final Map<String, dynamic> responseBody = json.decode(response.body);
//
//     final String? accessToken = responseBody['access_token'];
//     final String? idToken = responseBody['id_token'];
//
//     if (accessToken == null || idToken == null) {
//       return null;
//     }
//     final OAuthCredential credential =
//         MicrosoftAuthProvider.credential(accessToken);
//     UserCredential userCredential =
//         await FirebaseAuth.instance.signInWithCredential(credential);
//     return userCredential;
//   }
//
//   // only for android/ios not for web
//   // static Future<UserCredential?> handleSignIn() async {
//   //   final OAuthProvider provider = OAuthProvider("microsoft.com");
//   //   provider.setCustomParameters(
//   //       {"tenant": microsoftTenantID}
//   //   );
//   //   return await FirebaseAuth.instance.signInWithProvider(provider);
//   // }
// }
