import 'package:acadameet/app/app.colors.dart';
import 'package:flutter/material.dart';
import '../../routes/signup.view/signup.layout.dart';
import 'package:responsive_web_layout/responsive_web_layout.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightestRed,
      body: SafeArea(
        child: ResponsiveWebLayout.buildPlatformSpecificLayout(
          context: context,
          quadHDLayout: desktopSignUpView(context),
          fullHDLayout: desktopSignUpView(context),
          hdLayout: desktopSignUpView(context),
          sdLayout: desktopSignUpView(context),
          highResTabletLayout: tabletSignUpView(context),
          standardTabletLayout: tabletSignUpView(context),
          largeMobileLayout: mobileSignUpView(context),
          mediumMobileLayout: mobileSignUpView(context),
          smallMobileLayout: mobileSignUpView(context),
        ),
      ),
    );
  }
}
