import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

const storage = FlutterSecureStorage();

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
  static Future<void> saveGoogleUserCred(UserCredential? user)async {
    await storage.write(key: 'googleUserCreds', value: );
  }
}
