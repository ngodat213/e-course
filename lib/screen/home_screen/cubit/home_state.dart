part of 'home_cubit.dart';

enum HomeStatus { isEmpty, isLoading, isNotEmpty }

class HomeState extends Equatable {
  const HomeState(
      {required this.quizs,
      required this.status,
      required this.sliderIndex,
      required this.courses});
  final List<Quiz> quizs;
  final List<Course> courses;
  final int sliderIndex;
  final HomeStatus status;

  HomeState copyWith({
    List<Quiz>? quizs,
    HomeStatus? status,
    int? sliderIndex,
    List<Course>? courses,
  }) {
    return HomeState(
      quizs: quizs ?? this.quizs,
      status: status ?? this.status,
      sliderIndex: sliderIndex ?? this.sliderIndex,
      courses: courses ?? this.courses,
    );
  }

  factory HomeState.initial() {
    return const HomeState(
      quizs: [],
      courses: [],
      sliderIndex: 0,
      status: HomeStatus.isLoading,
    );
  }

  @override
  List<Object> get props => [quizs, courses, sliderIndex, status];
}
