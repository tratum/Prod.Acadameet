import 'package:acadameet/config/keys/keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

  final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId: googleAuthClientID,
    scopes: const <String>[

    ],
  );

  Future<void> handleGoogleSignIn() async {
    try {
      await googleSignIn.signIn();
    } catch (error) {
      debugPrint("$error");
    }
  }

  Future<void> signInSilently() async {
    try {
      final GoogleSignInAccount? account = await googleSignIn.signInSilently();
      if (account != null) {
        debugPrint('Signed in silently as ${account.displayName}');
      } else {
        debugPrint('No previously signed in user');
      }
    } catch (error) {
      debugPrint("$error");
    }
  }

  Future<void> checkScopes() async {
    final hasScopes = await googleSignIn.canAccessScopes([
      'email',
      'https://www.googleapis.com/auth/userinfo.profile',
    ]);

    if (!hasScopes) {
      await googleSignIn.requestScopes([
        'email',
        'https://www.googleapis.com/auth/userinfo.profile',
      ]);
    } else {
      debugPrint('Scopes are already granted');
    }
  }
