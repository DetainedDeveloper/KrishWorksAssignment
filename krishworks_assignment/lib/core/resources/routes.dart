import 'package:flutter/widgets.dart';
import 'package:krishworks_assignment/features/home/view/screens/home_screen.dart';
import 'package:krishworks_assignment/features/authentication/view/screens/auth_screen.dart';
import 'package:krishworks_assignment/features/splash/views/screens/splash_screen.dart';

abstract class AppRoutes {
  static const String splash = '/';
  static const String auth = '/auth';
  static const String home = '/home';

  static Map<String, WidgetBuilder> routes = {
    splash: (_) => const SplashScreen(),
    auth: (_) => const AuthScreen(),
    home: (_) => const HomeScreen(),
  };
}
