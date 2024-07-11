import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../../app/app.common.functions.dart';

// const storage = FlutterSecureStorage();

class GoogleAuthHandler {
  static Future<UserCredential?> handleSignIn() async {
    final GoogleSignIn gSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? gUser = await gSignIn.signIn();
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      throw Exception("Error during Google sign-in: $e");
    }
  }

  static Future<void> signInHandler(BuildContext context) async {
    final GoogleSignIn gSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? gUser = await gSignIn.signIn();
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );
      final userCred =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (context.mounted) {
        Provider.of<GoogleUserStateProvider>(context)
            .googleUserStateNotifier(userCred);
        context.go('/dashboard');
      }
    } catch (e) {
      throw Exception("Error during Google sign-in: $e");
    }
  }
// static Future<void> saveGoogleUserCred(UserCredential? user)async {
//   await storage.write(key: 'googleUserCreds', value: );
// }
}
