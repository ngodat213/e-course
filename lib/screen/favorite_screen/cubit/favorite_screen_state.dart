part of 'favorite_screen_cubit.dart';

enum CourseScreenStatus { isEmpty, isLoading, isNotEmpty }

class FavoriteScreenState extends Equatable {
  const FavoriteScreenState({required this.courses, required this.status});

  final List<Course> courses;
  final CourseScreenStatus status;

  FavoriteScreenState copyWith({
    List<Course>? courses,
    CourseScreenStatus? status,
  }) {
    return FavoriteScreenState(
      courses: courses ?? this.courses,
      status: status ?? this.status,
    );
  }

  factory FavoriteScreenState.initial() {
    return const FavoriteScreenState(
      courses: [],
      status: CourseScreenStatus.isLoading,
    );
  }

  @override
  List<Object> get props => [courses, status];
}
