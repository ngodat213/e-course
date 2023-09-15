import 'package:cloudinary_flutter/cloudinary_context.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/bloc_observer.dart';
import 'package:quiz_flutter/firebase_options.dart';
import 'package:quiz_flutter/repo/app_repository.dart/app_repository.dart';
import 'package:quiz_flutter/repo/auth_repository.dart';
import 'package:quiz_flutter/screen/app/app.dart';

Future<void> main() {
  return BlocOverrides.runZoned(
    () async {
      CloudinaryContext.cloudinary =
          Cloudinary.fromCloudName(cloudName: "duhncgkpo");
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
      final AuthRepository authRepository = AuthRepository();
      final AppRepository appRepository = AppRepository();
      runApp(App(authRepository: authRepository, appRepository: appRepository));
    },
    blocObserver: AppBlocObserver(),
  );
}
