import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/bloc_observer.dart';
import 'package:quiz_flutter/firebase_options.dart';
import 'package:quiz_flutter/repo/app_repository.dart/app_repository.dart';
import 'package:quiz_flutter/repo/auth_repository.dart';
import 'package:quiz_flutter/repo/user_repository/user_repository.dart';
import 'package:quiz_flutter/screen/app/app.dart';

Future<void> main() {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.android,
      );
      final AuthRepository authRepository = AuthRepository();
      final AppRepository appRepository = AppRepository();
      final UserRepository userRepository = UserRepository();
      runApp(App(
        authRepository: authRepository,
        appRepository: appRepository,
        userRepository: userRepository,
      ));
    },
    blocObserver: AppBlocObserver(),
  );
}
