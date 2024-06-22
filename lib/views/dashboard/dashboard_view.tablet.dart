import 'package:flutter/material.dart';
import 'package:responsive_web_layout/responsive_web_layout.dart';
import 'package:stacked/stacked.dart';

import 'dashboard_view_model.dart';

class DashboardViewTablet extends ViewModelWidget<DashboardViewModel> {
  const DashboardViewTablet({super.key});

  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Scaffold(
      body: ResponsiveWebLayout.buildTabletLayout(
        context: context,
        highResTabletLayout: const Placeholder(),
        standardTabletLayout: const Placeholder(),
      ),
    );
  }
}
