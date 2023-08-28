part of 'sign_up_cubit.dart';

enum SignUpStatus { initial, submitting, success, error }

class SignUpState extends Equatable {
  final String displayName;
  final String phoneNumber;
  final String email;
  final String password;
  final String confirmPassword;
  final SignUpStatus status;
  final String? errorMsg;

  const SignUpState({
    required this.displayName,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.status,
    this.errorMsg,
  });

  factory SignUpState.initial() {
    return const SignUpState(
      displayName: '',
      phoneNumber: '',
      email: '',
      password: '',
      confirmPassword: '',
      status: SignUpStatus.initial,
    );
  }

  SignUpState copyWith({
    String? displayName,
    String? email,
    String? phoneNumber,
    String? password,
    String? confirmPassword,
    SignUpStatus? status,
    String? errorMsg,
  }) {
    return SignUpState(
      displayName: displayName ?? this.displayName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  List<Object> get props => [
        displayName,
        phoneNumber,
        email,
        password,
        confirmPassword,
        status,
      ];
}
