part of 'home_cubit.dart';

enum QuizStatus { isEmpty, isLoading, isNotEmpty }

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class LoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class LoadedQuizState extends HomeState {
  const LoadedQuizState({required this.quizs, required this.status});
  final List<Quiz> quizs;
  final QuizStatus status;

  factory LoadedQuizState.initial() {
    return const LoadedQuizState(
      quizs: [],
      status: QuizStatus.isLoading,
    );
  }
  @override
  List<Object> get props => [quizs];
}

final class HomeInitial extends HomeState {}
