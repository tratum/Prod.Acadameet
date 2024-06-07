// lib/msal_interop.dart
@JS()
library msal_interop;

import 'package:js/js.dart';

@JS('signIn')
external dynamic signIn();

@JS('getToken')
external dynamic getToken();
