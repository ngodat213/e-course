part of 'sign_up_cubit.dart';

enum SignUpStatus { initial, submitting, success, error }

class SignUpState extends Equatable {
  final SignUpStatus status;
  final String? errorMsg;

  const SignUpState({
    required this.status,
    this.errorMsg,
  });

  factory SignUpState.initial() {
    return const SignUpState(
      status: SignUpStatus.initial,
    );
  }

  SignUpState copyWith({
    SignUpStatus? status,
    String? errorMsg,
  }) {
    return SignUpState(
      status: status ?? this.status,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  List<Object> get props => [status];
}
