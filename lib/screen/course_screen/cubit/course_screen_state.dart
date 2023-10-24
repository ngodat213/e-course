part of 'course_screen_cubit.dart';

enum CourseScreenStatus { isEmpty, isLoading, isNotEmpty }

class CourseScreenState extends Equatable {
  const CourseScreenState({required this.courses, required this.status});
  final List<Course> courses;
  final CourseScreenStatus status;

  CourseScreenState copyWith({
    List<Course>? courses,
    CourseScreenStatus? status,
  }) {
    return CourseScreenState(
      courses: courses ?? this.courses,
      status: status ?? this.status,
    );
  }

  factory CourseScreenState.initial() {
    return const CourseScreenState(
      courses: [],
      status: CourseScreenStatus.isLoading,
    );
  }

  @override
  List<Object> get props => [courses, status];
}
