// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_in_bloc.dart';

class SignInEvent {
  const SignInEvent();
}

class EmailEvent extends SignInEvent {
  final String email;
  const EmailEvent(
    this.email,
  );
}

class PasswordEvent extends SignInEvent {
  final String password;
  const PasswordEvent(
    this.password,
  );
}
