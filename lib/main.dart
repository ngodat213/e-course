import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_flutter/firebase_options.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/l10n/support_locale.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quiz_flutter/manager/manager_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...ManagerProvider.provider],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: ManagerRoutes.splashScreen,
        supportedLocales: L10n.support,
        locale: const Locale('en'),
        routes: {...ManagerRoutes.manager},
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode &&
                supportedLocale.countryCode == locale?.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
      ),
    );
  }
}
