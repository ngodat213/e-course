part of 'home_cubit.dart';

enum HomeStatus { isEmpty, isLoading, isNotEmpty }

class HomeState {
  const HomeState(
      {required this.quizs, required this.status, required this.courses});
  final List<Quiz> quizs;
  final List<Course> courses;
  final HomeStatus status;

  HomeState copyWith({
    List<Quiz>? quizs,
    HomeStatus? status,
    List<Course>? courses,
  }) {
    return HomeState(
      quizs: quizs ?? this.quizs,
      status: status ?? this.status,
      courses: courses ?? this.courses,
    );
  }

  factory HomeState.initial() {
    return const HomeState(
      quizs: [],
      courses: [],
      status: HomeStatus.isLoading,
    );
  }
  @override
  List<Object> get props => [quizs, courses, status];
}
