import 'package:acadameet/config/microsoft_functions.dart';
import 'package:flutter/material.dart';

import '../../config/microsoft_auth.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF000000),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
          child: FittedBox(
            child: Row(
              children: [
                Image.network(
                  "https://tratum.github.io/cloud-asset-storage/images/acadameet/logo-nobg.webp",
                  fit: BoxFit.contain,
                  width: 60,
                  height: 60,
                  cacheHeight: 60,
                  cacheWidth: 60,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "Acadameet",
                  style: TextStyle(
                    fontFamily: 'GlacialIndifference',
                    fontSize: 38,
                    fontWeight: FontWeight.w800,
                    color: Color(0XFFFFFFFF),
                  ),
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Center(
            child: Image.network(
              "https://tratum.github.io/cloud-asset-storage/images/acadameet/f-nobg.webp",
              width: MediaQuery.of(context).size.width / 0.75,
              height: MediaQuery.of(context).size.height / 2.2,
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Center(
            child: Text(
              "Connecting Students",
              // style: GoogleFonts.ubuntu(
              //   fontSize: 20,
              //   color: const Color(0XFFFFFFFF),
              //   fontWeight: FontWeight.w500,
              // ),
            ),
          ),
          const Center(
            child: Text(
              "and Faculty with Ease, One Click",
              // style: GoogleFonts.ubuntu(
              //   fontSize: 20,
              //   color: const Color(0XFFFFFFFF),
              //   fontWeight: FontWeight.w500,
              // ),
            ),
          ),
          const Center(
            child: Text(
              "at a Time.",
              // style: GoogleFonts.ubuntu(
              //   fontSize: 20,
              //   color: const Color(0XFFFFFFFF),
              //   fontWeight: FontWeight.w500,
              // ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          SizedBox(
            // width: 235,  // 217 for One Plus Nord CE2 Lite
            height: 41,
            child: FittedBox(
              child: ElevatedButton(
                onPressed: () async {
                  final result = await MicrosoftAuth.oauth.login();
                  result.fold(
                    (l) => debugPrint('--------------------Error: $l'),
                    (r) {
                      // String? accessToken = r.accessToken;
                      // String? idToken = r.idToken;
                      // String? refreshToken = r.refreshToken;
                      // String? tokenType = r.tokenType;
                      // int? expiresIn = r.expiresIn;
                      saveAccessToken(r.accessToken);
                      authUserDataHandler(context);
                    },
                  );
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.only(left: 12, right: 12)),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero)),
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0XFFFFFFFF)),
                ),
                child: Row(
                  children: [
                    Image.network(
                      "https://tratum.github.io/cloud-asset-storage/images/microsoft-logo.webp",
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text("Sign-In With Microsoft",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Color(0XFF5E5E5E))),
                    const SizedBox(
                      width: 12,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
