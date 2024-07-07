import 'package:flutter/material.dart';
import 'package:responsive_web_layout/responsive_web_layout.dart';

import 'login.layout.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveWebLayout.buildPlatformSpecificLayout(
          context: context,
          quadHDLayout: desktopLoginLayout(context),
          fullHDLayout: desktopLoginLayout(context),
          hdLayout: desktopLoginLayout(context),
          sdLayout: desktopLoginLayout(context),
          largeMobileLayout: mobileLoginLayout(context),
          mediumMobileLayout: mobileLoginLayout(context),
          smallMobileLayout: mobileLoginLayout(context),
          highResTabletLayout: tabletLoginLayout(context),
          standardTabletLayout: tabletLoginLayout(context),
        ),
      ),
    );
  }
}
