import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/app.constants.dart';
import '../../config/google/google_auth_handler.dart';

Widget desktopLoginLayout(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0XFF101010),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              children: [
                const Spacer(),
                Image.network(
                  "https://tratum.github.io/cloud-asset-storage/images/acadameet/Acadameet-Logo-bgremove.webp",
                  cacheWidth: 80,
                  cacheHeight: 80,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                horizontalSpaceMedium,
                const Text(
                  "Acadameet",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'GlacialIndifference',
                    color: Color(0XFFFFFFFF),
                    fontSize: 52,
                  ),
                ),
                const Spacer(),
              ],
            ),
            verticalSpaceMedium,
            const Text(
              "Connecting Students and Faculty with Ease, One Click at a Time",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'GlacialIndifference',
                color: Color(0XFFFFFFFF),
                fontSize: 32,
              ),
            ),
            verticalSpaceLarge,
            Center(
              child: Image.network(
                "https://tratum.github.io/cloud-asset-storage/images/acadameet/f-nobg.webp",
                width: MediaQuery.of(context).size.width / 0.75,
                height: MediaQuery.of(context).size.height / 2.2,
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
            ),
            verticalSpaceSemiMassive,
            Row(
              children: [
                const Spacer(),
                ElevatedButton(
                  // onPressed: () async {
                  //   final result = await MicrosoftAuthHandler.oauth.login();
                  //   result.fold(
                  //     (l) => log('--------------------Error: $l'),
                  //     (r) {
                  //       // String? accessToken = r.accessToken;
                  //       // String? idToken = r.idToken;
                  //       // String? refreshToken = r.refreshToken;
                  //       // String? tokenType = r.tokenType;
                  //       // int? expiresIn = r.expiresIn;
                  //       saveAccessToken(r.accessToken);
                  //       authUserDataHandler();
                  //     },
                  //   );
                  // },

                  // onPressed: () async {
                  //   try {
                  //     await MicrosoftAuthHandler.handleSignIn();
                  //   } catch (e) {
                  //     debugPrint("Error during Microsoft sign-in: $e");
                  //   }
                  // try {
                  //   await MicrosoftAuthHandler.handleSignIn().then((value) {
                  //     if (value != null) {
                  //       locator<RouterService>().replaceWithDashboardView();
                  //     } else {
                  //       throw Exception("User canceled the sign-in process.");
                  //     }
                  //   });
                  // } catch (e) {
                  //   log("Error during Microsoft sign-in: $e");
                  // }
                  onPressed: () {
                    // Having Problems with Microsoft Authentication
                  },
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(
                        const EdgeInsets.only(left: 12)),
                    shape: WidgetStateProperty.all(const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero)),
                    backgroundColor:
                        WidgetStateProperty.all(const Color(0XFFFFFFFF)),
                  ),
                  child: SizedBox(
                    width: 205,
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 4),
                      child: Row(
                        children: [
                          Image.network(
                            "https://tratum.github.io/cloud-asset-storage/images/microsoft-logo.webp",
                            height: 30,
                            width: 30,
                          ),
                          const Spacer(),
                          const Text("Sign in with Microsoft",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Color(0XFF5E5E5E))),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
            verticalSpaceLarge,
            Row(
              children: [
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    GoogleAuthHandler.signInHandler(context);
                    // try {
                    //   await GoogleAuthHandler.handleSignIn().then((value) {
                    //     if (value != null) {
                    //       context.go('/dashboard');
                    //     } else {
                    //       throw Exception("User canceled the sign-in process.");
                    //     }
                    //   });
                    // } catch (e) {
                    //   log("Error during Google sign-in: $e");
                    // }
                  },
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(
                        const EdgeInsets.only(left: 12)),
                    shape: WidgetStateProperty.all(const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero)),
                    backgroundColor:
                        WidgetStateProperty.all(const Color(0XFFFFFFFF)),
                  ),
                  child: SizedBox(
                    width: 205,
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 4),
                      child: Row(
                        children: [
                          Image.network(
                            "https://tratum.github.io/cloud-asset-storage/images/google.webp",
                            height: 25,
                            width: 25,
                          ),
                          const Spacer(),
                          const Text("Sign in with Google",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Color(0XFF5E5E5E))),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget mobileLoginLayout(BuildContext context) {
  return const Placeholder();
}

Widget tabletLoginLayout(BuildContext context) {
  return const Placeholder();
}
