import 'package:flutter/material.dart';
import 'package:responsive_web_layout/responsive_web_layout.dart';

import 'home.layout.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFFFFFF),
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
