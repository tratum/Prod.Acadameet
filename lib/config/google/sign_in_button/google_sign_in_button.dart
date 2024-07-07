import '../google_functions.dart';
import 'stub.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../app/app.locator.dart';
import 'package:acadameet/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:google_sign_in_web/web_only.dart' as web;

Widget buildSignInButton({HandleSignInFn? onPressed}) {
  return web.renderButton();
}

Widget googleAuthHandler(GoogleSignInAccount? currUser){
  if(currUser!=null){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      locator<RouterService>().navigateToDashboardView();
    });
    return const SizedBox.shrink();
  }
  else{
    return buildSignInButton(
      onPressed: handleGoogleSignIn,
    );
   }
}
