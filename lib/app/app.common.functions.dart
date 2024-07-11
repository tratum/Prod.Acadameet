import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GoogleUserStateProvider with ChangeNotifier {
  UserCredential? _userState;
  UserCredential? get userState => _userState;

  void googleUserStateNotifier(UserCredential? state) {
    _userState = state;
    notifyListeners();
  }
}
