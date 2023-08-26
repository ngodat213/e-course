part of 'forgot_password_bloc.dart';

class ForgotPasswordEvent {
  const ForgotPasswordEvent();
}

class EmailEvent extends ForgotPasswordEvent {
  final String email;
  const EmailEvent(
    this.email,
  );
}
