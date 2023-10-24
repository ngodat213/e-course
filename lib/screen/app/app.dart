import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/l10n/support_locale.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quiz_flutter/manager/manager_provider.dart';
import 'package:quiz_flutter/repo/app_repository.dart/app_repository.dart';
import 'package:quiz_flutter/repo/auth_repository.dart';
import 'package:quiz_flutter/repo/user_repository/user_repository.dart';
import 'package:quiz_flutter/screen/change_language/cubit/change_language_cubit.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required AuthRepository authRepository,
    required AppRepository appRepository,
    required UserRepository userRepository,
  })  : _authRepository = authRepository,
        _appRepository = appRepository,
        _userRepository = userRepository;

  final AuthRepository _authRepository;
  final AppRepository _appRepository;
  final UserRepository _userRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _authRepository),
        RepositoryProvider.value(value: _appRepository),
        RepositoryProvider.value(value: _userRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          ...ManagerProvider.provider,
          BlocProvider(create: (context) => ChangeLanguageCubit()..getLang())
        ],
        child: Builder(builder: (context) {
          final stateAppLang = context.watch<ChangeLanguageCubit>().state;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: ManagerRoutes.splashScreen,
            supportedLocales: L10n.support,
            locale: stateAppLang.locale,
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
          );
        }),
      ),
    );
  }
}
