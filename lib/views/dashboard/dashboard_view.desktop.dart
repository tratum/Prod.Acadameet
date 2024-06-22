import 'package:flutter/material.dart';
import 'package:responsive_web_layout/responsive_web_layout.dart';
import 'package:stacked/stacked.dart';

import '../../../commons/common_widgets.dart';
import 'dashboard_view_model.dart';

class DashboardViewDesktop extends ViewModelWidget<DashboardViewModel> {
  const DashboardViewDesktop({super.key});

  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveWebLayout.buildDesktopLayout(
          context: context,
          quadHDLayout: desktopDashboardView(context),
          fullHDLayout: desktopDashboardView(context),
          hdLayout: desktopDashboardView(context),
          sdLayout: desktopDashboardView(context),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   elevation: 20,
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      //   backgroundColor: const Color(0XFF121212),
      //   onPressed: () {
      //     if (viewModel.isAtBottom) {
      //       ContentScrolling.autoScroll(
      //         scrollPosition:
      //             viewModel.scrollController.position.minScrollExtent,
      //         conn: viewModel.scrollController,
      //       );
      //     } else {
      //       ContentScrolling.autoScroll(
      //         scrollPosition:
      //             viewModel.scrollController.position.maxScrollExtent,
      //         conn: viewModel.scrollController,
      //       );
      //     }
      //   },
      //   child: Center(
      //     child: ScaleOnHover(
      //       scale: 22,
      //       child: FaIcon(
      //         viewModel.isAtBottom
      //             ? FontAwesomeIcons.chevronUp
      //             : FontAwesomeIcons.chevronDown,
      //         size: 18,
      //         color: const Color(0XFFfafafa),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
