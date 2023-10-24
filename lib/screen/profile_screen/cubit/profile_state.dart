part of 'profile_cubit.dart';

enum ProfileStatus { initial, submitting, success, error }

class ProfileState extends Equatable {
  const ProfileState({
    required this.userName,
    required this.newEmail,
    required this.oldEmail,
    required this.password,
    required this.email,
    required this.phoneNumber,
    required this.resetPassword,
    required this.status,
  });
  final String userName;
  final String newEmail;
  final String oldEmail;
  final String password;
  final String email;
  final String phoneNumber;
  final String resetPassword;
  final ProfileStatus status;

  factory ProfileState.initial() {
    return const ProfileState(
      userName: "",
      newEmail: "",
      oldEmail: "",
      password: "",
      email: "",
      phoneNumber: "",
      resetPassword: "",
      status: ProfileStatus.initial,
    );
  }

  ProfileState copyWith({
    String? userName,
    String? newEmail,
    String? oldEmail,
    String? password,
    String? email,
    String? phoneNumber,
    String? resetPassword,
    ProfileStatus? status,
  }) {
    return ProfileState(
      userName: userName ?? this.userName,
      newEmail: newEmail ?? this.newEmail,
      oldEmail: oldEmail ?? this.oldEmail,
      password: password ?? this.password,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      resetPassword: resetPassword ?? this.resetPassword,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        userName,
        newEmail,
        oldEmail,
        password,
        email,
        phoneNumber,
        resetPassword,
        status
      ];
}
