import 'package:flutter/material.dart';
import 'package:responsive_web_layout/responsive_web_layout.dart';

import 'dashboard.layout.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveWebLayout.buildPlatformSpecificLayout(
          context: context,
          quadHDLayout: desktopDashboardLayout(context),
          fullHDLayout: desktopDashboardLayout(context),
          hdLayout: desktopDashboardLayout(context),
          sdLayout: desktopDashboardLayout(context),
          largeMobileLayout: mobileDashboardLayout(context),
          mediumMobileLayout: mobileDashboardLayout(context),
          smallMobileLayout: mobileDashboardLayout(context),
          highResTabletLayout: tabletDashboardLayout(context),
          standardTabletLayout: tabletDashboardLayout(context),
        ),
      ),
    );
  }
}
