part of 'setting_cubit.dart';

enum SettingStatus { initial, submitting, success, error }

class SettingState extends Equatable {
  const SettingState({required this.status});
  final SettingStatus status;

  factory SettingState.initial() {
    return const SettingState(
      status: SettingStatus.initial,
    );
  }

  SettingState copyWith({
    SettingStatus? status,
  }) {
    return SettingState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}
