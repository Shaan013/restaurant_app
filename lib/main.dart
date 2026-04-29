import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/locator/main_locator.dart';
import 'generated/l10n.dart';
import 'router/app_route.dart';
import 'values/theme/app_theme.dart';

import 'core/db/hive/hive_service.dart';
import 'core/db/shared_pref/shared_pref_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive
  await HiveService.init();

  // Initialize SharedPreferences
  await SharedPrefService.init();

  // Setup Locator
  await setupLocator();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: Size(393.73, 872),
      builder: (context, child) {
        return MaterialApp.router(
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: const Locale('en'),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          themeMode: .light,
          // darkTheme: AppTheme.darkTheme,
          theme: AppTheme.light,
          routerConfig: appRoute.config(),
        );
      },
      // child: const HomePage(),
    );
  }
}
