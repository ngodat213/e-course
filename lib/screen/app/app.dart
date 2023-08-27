import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:quiz_flutter/configs/routes.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/l10n/support_locale.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quiz_flutter/manager/manager_provider.dart';
import 'package:quiz_flutter/repo/auth_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:quiz_flutter/screen/app/bloc/app_bloc.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepository,
      child: MultiProvider(
        providers: [...ManagerProvider.provider],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: FlowBuilder<AppStatus>(
            state: context.select((AppBloc bloc) => bloc.state.status),
            onGeneratePages: onGenerateAppViewPages,
          ),
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
