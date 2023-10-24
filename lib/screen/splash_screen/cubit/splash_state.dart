part of 'splash_cubit.dart';

enum SplashStatus { initial, submitting, success, error }

class SplashState extends Equatable {
  final SplashStatus status;

  const SplashState({
    required this.status,
  });

  factory SplashState.initial() {
    return const SplashState(
      status: SplashStatus.initial,
    );
  }

  SplashState copyWith({
    SplashStatus? status,
  }) {
    return SplashState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}
