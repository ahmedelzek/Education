
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens/auth/login/login_screen.dart';
import '../../screens/auth/register/register_screen.dart';
import '../../screens/user_admin_screen/chapter/chapters_screen.dart';
import '../../screens/user_admin_screen/chapter_questions/questions.dart';

abstract class Routes {
  static const String chaptersRoute = "/chapters";
  static const String registerRoute = "/register";
  static const String loginRoute = "/login";
  static const String questionsRoute = "/questions";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      case chaptersRoute:
        return MaterialPageRoute(builder: (_) => const ChaptersScreen());

      case questionsRoute:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => QuestionsScreen(
            chapterName: args['chapterName'],
            chapterNumber: args['chapterNumber'],
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}
