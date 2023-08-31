import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/l10n/support_locale.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quiz_flutter/manager/manager_provider.dart';
import 'package:quiz_flutter/repo/app_repository.dart/app_repository.dart';
import 'package:quiz_flutter/repo/auth_repository.dart';
import 'package:quiz_flutter/screen/app/bloc/app_bloc.dart';
import 'package:quiz_flutter/screen/home_screen/cubit/home_cubit.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required AuthRepository authRepository,
    required AppRepository appRepository,
  })  : _authRepository = authRepository,
        _appRepository = appRepository;

  final AuthRepository _authRepository;
  final AppRepository _appRepository;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _authRepository),
        RepositoryProvider.value(value: _appRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AppBloc(authRepository: _authRepository)),
          BlocProvider(
              create: (context) => HomeCubit(appRepository: _appRepository)),
          ...ManagerProvider.provider
        ],
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
      ),
    );
  }
}
