import 'package:acadameet/ui/views/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_web_layout/responsive_web_layout.dart';
import 'package:stacked/stacked.dart';

class HomeViewMobile extends ViewModelWidget<HomeViewModel> {
  const HomeViewMobile({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveWebLayout.buildTabletLayout(
          context: context,
          highResTabletLayout: const Placeholder(),
          standardTabletLayout: const Placeholder(),
        ),
      ),
    );
  }
}
