import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:quiz_flutter/screen/sign_in/bloc/sign_in_bloc.dart';
import 'package:quiz_flutter/screen/sign_up/bloc/sign_up_bloc.dart';

class ManagerProvider {
  ManagerProvider._();

  static List<SingleChildWidget> provider = [
    BlocProvider(create: (context) => SignInBloc()),
    BlocProvider(create: (context) => SignUpBloc()),
    BlocProvider(create: (context) => SignUpBloc()),
  ];
}
