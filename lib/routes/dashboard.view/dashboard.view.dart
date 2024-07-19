import 'package:flutter/material.dart';
import 'package:responsive_web_layout/responsive_web_layout.dart';

import 'dashboard.layout.dart';

class DashboardView extends StatefulWidget {
  final String accessToken;
  const DashboardView({super.key, required this.accessToken});

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
          quadHDLayout: desktopDashboardLayout(context, widget.accessToken),
          fullHDLayout: desktopDashboardLayout(context, widget.accessToken),
          hdLayout: desktopDashboardLayout(context, widget.accessToken),
          sdLayout: desktopDashboardLayout(context, widget.accessToken),
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
