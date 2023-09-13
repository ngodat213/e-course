part of 'course_detail_cubit.dart';

enum CourseDetail { isEmpty, isLoading, isNotEmpty }

class CourseDetailState extends Equatable {
  const CourseDetailState({
    required this.course,
    required this.courseLesson,
    required this.courseVideo,
    required this.status,
  });
  final Course course;
  final List<CourseLesson> courseLesson;
  final List<CourseVideo> courseVideo;
  final CourseDetail status;

  CourseDetailState copyWith({
    Course? course,
    List<CourseLesson>? courseLesson,
    List<CourseVideo>? courseVideo,
    CourseDetail? status,
  }) {
    return CourseDetailState(
      course: course ?? this.course,
      courseLesson: courseLesson ?? this.courseLesson,
      courseVideo: courseVideo ?? this.courseVideo,
      status: status ?? this.status,
    );
  }

  factory CourseDetailState.initial() {
    return CourseDetailState(
      course: Course.initialCourse(),
      courseLesson: const [],
      courseVideo: const [],
      status: CourseDetail.isLoading,
    );
  }

  @override
  List<Object> get props => [course, courseLesson, courseVideo, status];
}
