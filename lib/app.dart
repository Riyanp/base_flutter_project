import 'package:base_flutter_project/features/dashboard/dashboard_screen.dart';
import 'package:base_flutter_project/features/login/login_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  final String accessToken;

  const MyApp({Key? key, required this.accessToken}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navRoutes = {
    LoginScreen.routeName: (context) => const LoginScreen(),
    DashboardScreen.routeName: (context) => const DashboardScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter App',
        scaffoldMessengerKey: rootScaffoldMessengerKey,
        theme: Theme.of(context),
        routes: _navRoutes,
        initialRoute: widget.accessToken.isEmpty
            ? LoginScreen.routeName
            : DashboardScreen.routeName,
        debugShowCheckedModeBanner: false);
  }
}

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
