import 'package:acadameet/app/app.colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/app.common.widgets.dart';
import '../../app/app.constants.dart';
import '../../config/firebase/db.firestore.dart';
import '../../config/google/google_auth_handler.dart';

Widget desktopSignUpView(BuildContext context) {
  final TextEditingController userEmailController = TextEditingController();
  return SafeArea(
    child: Stack(
      children: [
        Positioned(
          top: 200,
          left: 180,
          right: 180,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getScreenHeight(context) / 1.4,
                width: getScreenWidth(context) / 2.9,
                child: Card(
                  color: Color(0XFFFFFFFF),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sign Up For Your",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Outfit',
                              color: Color(0XFF222222),
                              fontSize: 42,
                              letterSpacing: 1),
                        ),
                        Text(
                          "Acadameet Account",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Outfit',
                              color: Color(0XFF222222),
                              fontSize: 42,
                              letterSpacing: 1),
                        ),
                        verticalSpaceMedium,
                        Text(
                          "Always free! No credit card required.",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'JosefinaSans',
                              color: Color(0XFF5B5B5B),
                              fontSize: 24,
                              letterSpacing: 1),
                        ),
                        verticalSpaceLarge,
                        SizedBox(
                          width: getScreenWidth(context) / 3 - 80,
                          child: TextFormField(
                            controller: userEmailController,
                            cursorColor: const Color(0xFF000000),
                            cursorWidth: 3,
                            cursorRadius: const Radius.circular(5),
                            style: const TextStyle(color: Color(0xFF000000)),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value == '') {
                                return 'Enter Your Email';
                              }
                              return null;
                            },
                            autovalidateMode: AutovalidateMode.disabled,
                            decoration: InputDecoration(
                              hintText: "Enter You Email",
                              hintStyle: const TextStyle(
                                color: Color(0XFF5B5B5B),
                                fontFamily: 'JosefinaSans',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: redPrimary,
                                  width: 2,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: Color(0xFFDBDBDB),
                                  width: 2,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: Color(0xFFDBDBDB),
                                  width: 2,
                                ),
                              ),
                              suffixStyle: const TextStyle(
                                color: Color(0xFF000000),
                                fontFamily: 'JosefinaSans',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        verticalSpaceSemiMedium,
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                backgroundColor: redPrimary,
                                padding: EdgeInsets.all(16)),
                            child: SizedBox(
                              width: getScreenWidth(context) / 3 - 80,
                              child: Center(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'JosefinaSans',
                                      color: Color(0XFFFFFFFF),
                                      fontSize: 20,
                                      letterSpacing: 1),
                                ),
                              ),
                            )),
                        verticalSpaceSemiMedium,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            lineSeparator(1, 250, darkBlueSecondary),
                            horizontalSpaceTiny,
                            const Text(
                              "OR",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Outfit',
                                color: darkBluePrimary,
                                fontSize: 16,
                                letterSpacing: 1,
                              ),
                            ),
                            horizontalSpaceTiny,
                            lineSeparator(1, 250, darkBlueSecondary),
                          ],
                        ),
                        verticalSpaceMedium,
                        Text(
                          "Easily connect your calendar by signing up with your Google Account.",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Outfit',
                              color: Color(0XFF222222),
                              fontSize: 18,
                              letterSpacing: 1),
                        ),
                        verticalSpaceSemiMedium,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
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
                                width: 220,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      "https://tratum.github.io/cloud-asset-storage/images/google.webp",
                                      height: 25,
                                      width: 25,
                                    ),
                                    horizontalSpaceSmall,
                                    const Text(
                                      "Sign Up with Google",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Outfit',
                                        fontSize: 20,
                                        color: Color(0XFFFFFFFF),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            horizontalSpaceMedium,
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
                                width: 242,
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
                                        "Sign Up with Microsoft",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Outfit',
                                        fontSize: 20,
                                        color: Color(0XFFFFFFFF),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              horizontalSpaceSuperMassive,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                    text: TextSpan(
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Outfit',
                          color: Color(0XFF222222),
                          fontSize: 42,
                          letterSpacing: 1
                      ),
                      children: <TextSpan> [
                        TextSpan(text: "Create your"),
                        TextSpan(text: " free ",style: TextStyle(color: redPrimary)),
                        TextSpan(text: 'Account'),
                      ],
                    ),
                    ),
                    verticalSpaceSemiMedium,
                    Text(
                        "Enjoy effortless appointment scheduling and elevate your academic experience with a Free Acadameet Account. Discover a new level of efficiency for all your academic needs",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Outfit',
                          color: darkestGrey,
                          fontSize: 22,
                          letterSpacing: 1
                      ),
                      softWrap: true,
                      overflow: TextOverflow.clip,
                    ),
                  ],
                ),
              )
            ],
          )
        ),
        Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Container(
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
          padding: const EdgeInsets.fromLTRB(180, 20, 180, 20),
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
                    color: Color(0xFF000000),
                    fontSize: 32,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  backgroundColor: const Color(0xFFF8F9FB),
                  padding: const EdgeInsets.all(12),
                  elevation: 0,
                ),
                child: const Text(
                  "Log In",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Outfit',
                    color: Color(0xFF000000),
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

Widget tabletSignUpView(BuildContext context) {
  return const Placeholder();
}

Widget mobileSignUpView(BuildContext context) {
  return const Placeholder();
}
