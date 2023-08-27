part of 'forgot_password_cubit.dart';

enum ForgotPasswordStatus { initial, submitting, success, error }

class ForgotPasswordState extends Equatable {
  final String email;
  final ForgotPasswordStatus status;
  const ForgotPasswordState({required this.email, required this.status});

  factory ForgotPasswordState.initial() {
    return const ForgotPasswordState(
      email: '',
      status: ForgotPasswordStatus.initial,
    );
  }

  ForgotPasswordState copyWith({
    String? email,
    ForgotPasswordStatus? status,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, status];
}
