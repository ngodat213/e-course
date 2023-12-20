part of 'sign_in_cubit.dart';

enum LoginStatus { initial, submitting, success, error }

class SignInState extends Equatable {
  final LoginStatus status;

  const SignInState({
    required this.status,
  });

  factory SignInState.initial() {
    return const SignInState(
      status: LoginStatus.initial,
    );
  }

  SignInState copyWith({
    LoginStatus? status,
  }) {
    return SignInState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}
