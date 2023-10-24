part of 'course_list_screen_cubit.dart';

enum CourseListScreenStatus { isEmpty, isLoading, isNotEmpty }

class CourseListScreenState extends Equatable {
  const CourseListScreenState({
    required this.courses,
    required this.status,
  });
  final List<Course> courses;
  final CourseListScreenStatus status;

  CourseListScreenState copyWith({
    List<Course>? courses,
    CourseListScreenStatus? status,
  }) {
    return CourseListScreenState(
      courses: courses ?? this.courses,
      status: status ?? this.status,
    );
  }

  factory CourseListScreenState.initial() {
    return const CourseListScreenState(
      courses: [],
      status: CourseListScreenStatus.isLoading,
    );
  }

  @override
  List<Object> get props => [courses, status];
}
