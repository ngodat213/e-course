part of 'setting_cubit.dart';

enum SettingStatus { initial, submitting, success, error }

class SettingState extends Equatable {
  const SettingState({
    required this.user,
    required this.status,
  });
  final User user;
  final SettingStatus status;

  factory SettingState.initial() {
    return SettingState(
      user: User.initialUser(),
      status: SettingStatus.initial,
    );
  }

  SettingState copyWith({
    SettingStatus? status,
    User? user,
  }) {
    return SettingState(
      user: user ?? this.user,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [user, status];
}
