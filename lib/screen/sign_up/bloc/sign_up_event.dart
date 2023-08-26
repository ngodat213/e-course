part of 'sign_up_bloc.dart';

abstract class SignUpEvent {
  const SignUpEvent();
}

class DisplayNameEvent extends SignUpEvent {
  final String displayName;

  const DisplayNameEvent(this.displayName);
}

class PhoneNumberEvent extends SignUpEvent {
  final String phoneNumber;

  const PhoneNumberEvent(this.phoneNumber);
}

class EmailEvent extends SignUpEvent {
  final String email;

  const EmailEvent(this.email);
}

class PasswordEvent extends SignUpEvent {
  final String password;

  const PasswordEvent(this.password);
}

class ConfirmPasswordEvent extends SignUpEvent {
  final String confirmPassword;

  const ConfirmPasswordEvent(this.confirmPassword);
}
