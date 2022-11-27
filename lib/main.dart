import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'core/app/app.locator.dart';
import 'core/app/app.router.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeManager.initialise();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      lightTheme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      builder: (context, lightTheme, dartTheme, themeMode) {
        return MaterialApp(
          title: 'Theme Switch',
          theme: lightTheme,
          darkTheme: dartTheme,
          themeMode: themeMode,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          navigatorKey: StackedService.navigatorKey,
          initialRoute: Routes.splashView,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorObservers: [StackedService.routeObserver],
        );
      },
    );
  }
}
