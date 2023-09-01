part of 'home_cubit.dart';

enum QuizStatus { isEmpty, isLoading, isNotEmpty }

class HomeState {
  const HomeState({required this.quizs, required this.status});
  final List<Quiz> quizs;
  final QuizStatus status;

  HomeState copyWith({
    List<Quiz>? quizs,
    QuizStatus? status,
  }) {
    return HomeState(
      quizs: quizs ?? this.quizs,
      status: status ?? this.status,
    );
  }

  factory HomeState.initial() {
    return const HomeState(
      quizs: [],
      status: QuizStatus.isLoading,
    );
  }
  @override
  List<Object> get props => [quizs];
}
