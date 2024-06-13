import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../keys/keys.dart';

class MicrosoftAuth {
  static final Config _config = Config(
    tenant: tenant,
    clientId: clientID,
    scope: scope,
    navigatorKey: navigatorKey,
    loader: const SizedBox(),
    webUseRedirect: true,
    redirectUri: redirectUrl,
    // responseType: responseType,
    // appBar: AppBar(
    //   title: const Text(''),
    // ),
  );

  static final AadOAuth oauth = AadOAuth(_config);
}
