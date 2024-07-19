import 'package:acadameet/routes/home.view/home.view.dart';
import 'package:acadameet/routes/signup.view/signup.view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'app/app.common.functions.dart';
import 'firebase_options.dart';
import 'routes/404.view/404.view.dart';
import 'routes/dashboard.view/dashboard.view.dart';

// import 'package:flutter_web_plugins/flutter_web_plugins.dart'; should only be used if you want to change the UrlStrategy

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // setUrlStrategy(PathUrlStrategy()); If this is used then client-side routing doesn't work properly.
  // setUrlStrategy(HashUrlStrategy()); This is used by default and client-side routing works properly but URLs include a /#/ segment.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => AuthenticationProvider(),
    child: const App(),
  ));
}

final GoRouter _gRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) {
        final token = state.extra as String? ?? 'No secret';
        return DashboardView(accessToken: token);
      },
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpView(),
    ),
  ],
  redirect: (context, state) {
    if (getCurrentUID() != null && state.path == '/') {
      return '/dashboard';
    } else if (getCurrentUID() == null && state.path == '/dashboard') {
      return '/';
    }
    return null;
  },
  errorBuilder: (context, state) => const ErrorView(),
);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Acadameet",
      routerConfig: _gRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
