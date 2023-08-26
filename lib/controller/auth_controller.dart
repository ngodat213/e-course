import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/screen/sign_in/bloc/sign_in_bloc.dart';
import 'package:provider/provider.dart';
import 'package:quiz_flutter/screen/sign_in/widget/custom_toast.dart';
import 'package:quiz_flutter/screen/sign_up/bloc/sign_up_bloc.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';

class AuthController {
  final BuildContext context;

  const AuthController({required this.context});

  Future<void> handleSignIn() async {
    try {
      final state = context.read<SignInBloc>().state;
      String email = state.email;
      String password = state.password;
      if (email.isEmpty) {
        toastInfo(msg: 'Need to fill email address');
      } else if (password.isEmpty) {
        toastInfo(msg: 'Need to fill password');
      } else {
        print('login...');
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        var user = credential.user;
        if (user != null) {
          toastInfo(msg: "Login successful");
          BaseNavigation.push(context, routeName: ManagerRoutes.homeScreen);
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        toastInfo(msg: "No user found for that email address");
      } else if (e.code == 'wrong-password') {
        toastInfo(msg: "Wrong passwrod");
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: "Your email format is wrong");
      }
    }
  }

  Future<void> handleSignUp() async {
    final state = context.read<SignUpBloc>().state;
    String displayName = state.displayName;
    String email = state.email;
    String phoneNumber = state.phoneNumber;
    String password = state.password;
    String confirmPassword = state.confirmPassword;
    if (displayName.isEmpty ||
        email.isEmpty ||
        phoneNumber.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      toastInfo(msg: 'Need to fill all text field');
    } else {
      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        if (credential.user != null) {
          await credential.user?.updateDisplayName(displayName);
          BaseNavigation.pop(context);
        }
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "weak-password":
            toastInfo(msg: "The password provided is too weak");
            break;
          case "email-already-in-use":
            toastInfo(msg: "The email is already in use");
            break;
          case "invalid-email":
            toastInfo(msg: "Your email addres is invalid");
            break;
        }
      }
    }
  }
}
