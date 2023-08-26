// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_up_bloc.dart';

class SignUpState {
  final String displayName;
  final String phoneNumber;
  final String email;
  final String password;
  final String confirmPassword;

  const SignUpState({
    this.displayName = "",
    this.phoneNumber = "",
    this.email = "",
    this.password = "",
    this.confirmPassword = "",
  });

  SignUpState copyWith({
    String? displayName,
    String? phoneNumber,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return SignUpState(
      displayName: displayName ?? this.displayName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}

class SignUpInitial extends SignUpState {}
