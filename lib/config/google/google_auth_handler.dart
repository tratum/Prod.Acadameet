import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../../app/app.common.functions.dart';
import '../../config/google/functions.google.dart';

class GoogleAuthHandler {
  static Future<void> signInHandler(BuildContext context) async {
    final GoogleSignIn gSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/gmail.send',
        'https://www.googleapis.com/auth/calendar.events',
      ],
    );
    try {
      final GoogleSignInAccount? gUser = await gSignIn.signIn();
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );
      saveGToken(gAuth.accessToken);
      final userCred =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (context.mounted) {
        Provider.of<AuthenticationProvider>(context, listen: false)
            .googleUserStateNotifier(userCred);
        context.replace('/dashboard', extra: gAuth.accessToken);
      }
      // final meetLink = await createGoogleMeetLink(gAuth.accessToken!);
      // print('------------------------ Google Meet link created: $meetLink');
      //
      // print('Sending email...');
      // await sendEmail(
      //   gAuth.accessToken!,
      //   'somvenisthere@gmail.com',
      //   'Meeting Invitation',
      //   'Dear User,\n\nPlease join the meeting using the following link: $meetLink\n\nBest regards,\nYour App',
      // );
      // print('Email sent successfully!');
    } catch (e) {
      throw Exception("Error during Google sign-in: $e");
    }
  }
}
