part of 'forgot_password_bloc.dart';

class ForgotPasswordState {
  final String email;
  const ForgotPasswordState({this.email = ""});

  ForgotPasswordState copyWith({String? email}) {
    return ForgotPasswordState(
      email: email ?? this.email,
    );
  }
}

final class ForgotPasswordInitial extends ForgotPasswordState {}
