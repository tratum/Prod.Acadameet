import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class MicrosoftAuth {
  static const String tenant = "organizations";
  static const String redirectUrl = "https://login.live.com/oauth20_desktop.srf";
  static const String scope = "openid profile email offline_access User.Read";
  static const String responseType = "code";
  static const String clientID = "16d5719f-86d1-47a2-848d-e9f63d07a968";

  static final Config _config = Config(
    tenant: tenant,
    clientId: clientID,
    scope: scope,
    navigatorKey: navigatorKey,
    loader: const SizedBox(),
    responseType: responseType,
    // appBar: AppBar(
    //   title: const Text(''),
    // ),
  );

  static final AadOAuth oauth = AadOAuth(_config);
}
