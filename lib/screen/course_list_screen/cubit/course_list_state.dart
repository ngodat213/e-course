part of 'course_list_cubit.dart';

enum CourseListStatus { isEmpty, isLoading, isNotEmpty }

class CourseListState extends Equatable {
  const CourseListState({required this.courses, required this.status});
  final List<Course> courses;
  final CourseListStatus status;

  CourseListState copyWith({
    List<Course>? courses,
    CourseListStatus? status,
  }) {
    return CourseListState(
      courses: courses ?? this.courses,
      status: status ?? this.status,
    );
  }

  factory CourseListState.initial() {
    return const CourseListState(
      courses: [],
      status: CourseListStatus.isLoading,
    );
  }
  @override
  List<Object> get props => [courses];
}
