import '../..//views/login/login_view.desktop.dart';
import '../../views/login/login_view.mobile.dart';
import '../../views/login/login_view.tablet.dart';
import '../../views/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({super.key});

  @override
  Widget builder(
      BuildContext context, LoginViewModel viewModel, Widget? child) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const LoginViewMobile(),
      tablet: (_) => const LoginViewTablet(),
      desktop: (_) => const LoginViewDesktop(),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}
