import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked/stacked.dart';
import '../../config/google/google_functions.dart';

class LoginViewModel extends BaseViewModel {
  GoogleSignInAccount? _currentUser;
  bool _isAuthorized = false;
  void _initGoogleSignIn() {
    googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) async {
      bool isAuthorized = account != null;

      if (kIsWeb && account != null) {
        isAuthorized = await googleSignIn.canAccessScopes(['email']);
      }

      _currentUser = account;
      _isAuthorized = isAuthorized;
      notifyListeners();
      //
      // if (isAuthorized) {
      //   await _handleGetContact(account!);
      // }
    });

    googleSignIn.signInSilently();
  }
  LoginViewModel (){
    _initGoogleSignIn();
    }
  GoogleSignInAccount? get currentUser => _currentUser;
  bool get isAuthorized => _isAuthorized;
}
