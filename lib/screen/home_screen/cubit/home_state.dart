part of 'home_cubit.dart';

enum HomeStatus { isEmpty, isLoading, isNotEmpty }

class HomeState {
  const HomeState({required this.quizs, required this.status});
  final List<Quiz> quizs;
  final HomeStatus status;

  HomeState copyWith({
    List<Quiz>? quizs,
    HomeStatus? status,
  }) {
    return HomeState(
      quizs: quizs ?? this.quizs,
      status: status ?? this.status,
    );
  }

  factory HomeState.initial() {
    return const HomeState(
      quizs: [],
      status: HomeStatus.isLoading,
    );
  }
  @override
  List<Object> get props => [quizs];
}
