import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'dashboard_view.desktop.dart';
import 'dashboard_view.mobile.dart';
import 'dashboard_view.tablet.dart';
import 'dashboard_view_model.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  const DashboardView({super.key});

  @override
  Widget builder(
    BuildContext context,
    DashboardViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const DashboardViewMobile(),
      tablet: (_) => const DashboardViewTablet(),
      desktop: (_) => const DashboardViewDesktop(),
    );
  }

  @override
  DashboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DashboardViewModel();
}
