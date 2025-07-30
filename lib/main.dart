import 'package:education/ui/core/routes_manager/generate_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:education/l10n/app_translations.dart';
import 'package:education/ui/core/resources/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'di/di.dart';


Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  configureDependencies();
  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Education',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          initialRoute: Routes.chaptersRoute,
          onGenerateRoute: Routes.generateRoute,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('en'),
          builder: (context, child) {
            // Initialize localization for all routes
            LocalizationManager().init(context);
            return child!;
          },
        );
      },
    );
  }
}