part of 'profile_cubit.dart';

enum ProfileStatus { initial, submitting, success, error }

class ProfileState extends Equatable {
  const ProfileState({
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.resetPassword,
    required this.status,
  });
  final String userName;
  final String email;
  final String phoneNumber;
  final String resetPassword;
  final ProfileStatus status;

  factory ProfileState.initial() {
    return const ProfileState(
      userName: "",
      email: "",
      phoneNumber: "",
      resetPassword: "",
      status: ProfileStatus.initial,
    );
  }

  ProfileState copyWith({
    String? userName,
    String? email,
    String? phoneNumber,
    String? resetPassword,
    ProfileStatus? status,
  }) {
    return ProfileState(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      resetPassword: resetPassword ?? this.resetPassword,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [userName, email, phoneNumber, resetPassword];
}
