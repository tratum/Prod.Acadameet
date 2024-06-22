import 'package:acadameet/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:responsive_web_layout/responsive_web_layout.dart';
import 'package:stacked/stacked.dart';

import '../../views/login/login_view_model.dart';

class LoginViewDesktop extends ViewModelWidget<LoginViewModel> {
  const LoginViewDesktop({super.key});

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveWebLayout.buildDesktopLayout(
          context: context,
          quadHDLayout: desktopLoginView(context),
          fullHDLayout: desktopLoginView(context),
          hdLayout: desktopLoginView(context),
          sdLayout: desktopLoginView(context),
        ),
      ),
    );
  }
}
