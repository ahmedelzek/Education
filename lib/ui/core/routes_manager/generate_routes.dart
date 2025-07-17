
import 'package:flutter/cupertino.dart';

import '../../screens/auth/login/login_screen.dart';
import '../../screens/auth/register/register_screen.dart';

abstract class Routes {
  static const String homeRoute = "/home";
  static const String registerRoute = "/register";
  static const String loginRoute = "/login";

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    return {
      loginRoute: (_) => const LoginScreen(),
      registerRoute: (_) => const RegisterScreen(),
    };
  }

}
