import 'package:acadameet/app/app.common.widgets.dart';
import 'package:acadameet/app/app.hover.extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/app.colors.dart';
import '../../app/app.constants.dart';
import '../../config/firebase/db.firestore.dart';
import '../../config/google/google_auth_handler.dart';

Widget desktopLoginLayout(BuildContext context) {
  return SafeArea(
    child: Stack(
      children: [
        Positioned(
          top: 80,
          left: 120,
          right: 120,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            verticalSpaceSemiLarge,
                            const Text(
                              "Streamline",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'JosefinaSans',
                                  color: redSecondary,
                                  fontSize: 64,
                                  letterSpacing: 1),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Your",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'JosefinaSans',
                                      color: redSecondary,
                                      fontSize: 64,
                                      letterSpacing: 1),
                                ),
                                horizontalSpaceSemiSmall,
                                Text(
                                  "Academic",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'JosefinaSans',
                                      color: redSecondary,
                                      fontSize: 64,
                                      letterSpacing: 1),
                                )
                              ],
                            ),
                            const Text(
                              "Day",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'JosefinaSans',
                                  color: redSecondary,
                                  fontSize: 64,
                                  letterSpacing: 1),
                            ),
                            verticalSpaceLarge,
                            const Text(
                              "Empowering students and teachers with effortless",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Outfit',
                                color: darkBluePrimary,
                                fontSize: 24,
                                letterSpacing: 1,
                              ),
                              softWrap: true,
                            ),
                            const Text(
                              "appointment scheduling, and management",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Outfit',
                                color: darkBluePrimary,
                                fontSize: 24,
                                letterSpacing: 1,
                              ),
                              softWrap: true,
                            ),
                            verticalSpaceLarge,
                            ElevatedButton(
                              onPressed: () async {
                                GoogleAuthHandler.signInHandler(context)
                                    .whenComplete(Database.syncGoogleUser);
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(20),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                backgroundColor: redPrimary,
                              ),
                              child: SizedBox(
                                width: 280,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Spacer(),
                                    Image.network(
                                      "https://tratum.github.io/cloud-asset-storage/images/google.webp",
                                      height: 25,
                                      width: 25,
                                    ),
                                    horizontalSpaceSmall,
                                    const Text(
                                      "Sign in with Google",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Outfit',
                                        fontSize: 24,
                                        color: Color(0XFFFFFFFF),
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                            ),
                            verticalSpaceMedium,
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
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(20),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                backgroundColor: redSecondary,
                              ),
                              child: SizedBox(
                                width: 280,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      "https://tratum.github.io/cloud-asset-storage/images/microsoft-logo.webp",
                                      height: 30,
                                      width: 30,
                                    ),
                                    horizontalSpaceSmall,
                                    const Text(
                                      "Sign in with Microsoft",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Outfit',
                                        fontSize: 24,
                                        color: Color(0XFFFFFFFF),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            verticalSpaceMedium,
                            Row(
                              children: [
                                lineSeparator(2, 140, darkBlueSecondary),
                                horizontalSpaceTiny,
                                const Text(
                                  "OR",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Outfit',
                                    color: darkBlueSecondary,
                                    fontSize: 16,
                                    letterSpacing: 1,
                                  ),
                                ),
                                horizontalSpaceTiny,
                                lineSeparator(2, 140, darkBlueSecondary),
                              ],
                            ),
                            verticalSpaceSemiSmall,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () => context.go('/signup'),
                                  child: const Text(
                                    "Sign Up with email,",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Outfit',
                                      color: redPrimary,
                                      fontSize: 14,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                                horizontalSpaceTiny,
                                const Text(
                                  "No credit card required",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Outfit',
                                    color: Color(0XFF222222),
                                    fontSize: 14,
                                    letterSpacing: 1,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.fromLTRB(120, 20, 120, 20),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.network(
                  "https://tratum.github.io/cloud-asset-storage/images/acadameet/logo.black.nobg.webp",
                  cacheWidth: 80,
                  cacheHeight: 65,
                  width: 80,
                  height: 65,
                  fit: BoxFit.cover,
                ),
                horizontalSpaceSemiSmall,
                GestureDetector(
                  onTap: () => context.go('/'),
                  child: const Text(
                    "Acadameet",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'JosefinaSans',
                        color: Color(0XFF000000),
                        fontSize: 32,
                        letterSpacing: 1),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                    child: const Text(
                  "Product",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'JosefinaSans',
                      color: Color(0XFF000000),
                      fontSize: 22,
                      letterSpacing: 1),
                )).scaleOnHover(scale: 12),
                horizontalSpaceSemiMedium,
                GestureDetector(
                    child: const Text(
                  "Resources",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'JosefinaSans',
                      color: Color(0XFF000000),
                      fontSize: 22,
                      letterSpacing: 1),
                )).scaleOnHover(scale: 12),
                horizontalSpaceSemiMedium,
                GestureDetector(
                    child: const Text(
                  "About Us",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'JosefinaSans',
                      color: Color(0XFF000000),
                      fontSize: 22,
                      letterSpacing: 1),
                )).scaleOnHover(scale: 12),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    backgroundColor: const Color(0XFFF8F9FB),
                    padding: const EdgeInsets.all(12),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Outfit',
                      color: Color(0XFF000000),
                      fontSize: 20,
                    ),
                  ),
                ),
                horizontalSpaceSemiMedium,
                ElevatedButton(
                  onPressed: () => context.go('/signup'),
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      backgroundColor: redPrimary,
                      padding: const EdgeInsets.all(12)),
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Outfit',
                      color: Color(0XFFFFFFFF),
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget mobileLoginLayout(BuildContext context) {
  return const Placeholder();
}

Widget tabletLoginLayout(BuildContext context) {
  return const Placeholder();
}
