
import 'package:flutter/cupertino.dart';

import '../../screens/auth/login/login_screen.dart';
import '../../screens/auth/register/register_screen.dart';
import '../../screens/user_admin_screen/chapter/chapters_screen.dart';

abstract class Routes {
  static const String chaptersRoute = "/chapters";
  static const String registerRoute = "/register";
  static const String loginRoute = "/login";

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    return {
      loginRoute: (_) => const LoginScreen(),
      registerRoute: (_) => const RegisterScreen(),
      chaptersRoute: (_) => const ChaptersScreen(),
    };
  }

}
