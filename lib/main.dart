import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'firebase_options.dart';
import 'routes/404.view/404.view.dart';
import 'routes/dashboard.view/dashboard.view.dart';
import 'routes/login.view/login.view.dart';

// import 'package:flutter_web_plugins/flutter_web_plugins.dart'; should only be used if you want to change the UrlStrategy

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // setUrlStrategy(PathUrlStrategy()); If this is used then client-side routing doesn't work properly.
  // setUrlStrategy(HashUrlStrategy()); This is used by default and client-side routing works properly but URLs include a /#/ segment.
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

final GoRouter _gRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardView(),
    ),
  ],
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
