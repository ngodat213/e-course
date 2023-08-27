import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/bloc_observer.dart';
import 'package:quiz_flutter/firebase_options.dart';
import 'package:quiz_flutter/repo/auth_repository.dart';
import 'package:quiz_flutter/screen/app/app.dart';

Future<void> main() {
  return BlocOverrides.runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    final AuthRepository authRepository = AuthRepository();
    runApp(App(authRepository: authRepository));
  }, blocObserver: AppBlocObserver());
}
