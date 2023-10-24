part of 'course_detail_cubit.dart';

enum CourseDetail { isEmpty, isLoading, isNotEmpty }

class CourseDetailState extends Equatable {
  const CourseDetailState({
    required this.course,
    required this.video,
    required this.courseLesson,
    required this.courseVideo,
    required this.status,
    required this.favorite,
  });
  final Course course;
  final String video;
  final List<CourseLesson> courseLesson;
  final List<CourseVideo> courseVideo;
  final bool favorite;
  final CourseDetail status;

  CourseDetailState copyWith({
    Course? course,
    String? video,
    List<CourseLesson>? courseLesson,
    List<CourseVideo>? courseVideo,
    bool? isFull,
    bool? favorite,
    CourseDetail? status,
  }) {
    return CourseDetailState(
      course: course ?? this.course,
      video: video ?? this.video,
      courseLesson: courseLesson ?? this.courseLesson,
      courseVideo: courseVideo ?? this.courseVideo,
      favorite: favorite ?? this.favorite,
      status: status ?? this.status,
    );
  }

  factory CourseDetailState.initial() {
    return CourseDetailState(
      course: Course.initialCourse(),
      video: "",
      courseLesson: const [],
      courseVideo: const [],
      favorite: false,
      status: CourseDetail.isLoading,
    );
  }

  @override
  List<Object> get props => [course, video, courseLesson, courseVideo, status];
}
