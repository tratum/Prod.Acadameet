import 'package:acadameet/ui/views/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_web_layout/responsive_web_layout.dart';
import 'package:stacked/stacked.dart';

import '../../../commons/common_widgets.dart';

class HomeViewDesktop extends ViewModelWidget<HomeViewModel> {
  const HomeViewDesktop({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      body: SafeArea(
        child:  ResponsiveWebLayout.buildDesktopLayout(
            context: context,
            quadHDLayout: desktopHomeView(context),
            fullHDLayout: desktopHomeView(context),
            hdLayout: desktopHomeView(context),
            sdLayout: desktopHomeView(context),
        ),
      ),
    );
  }

}