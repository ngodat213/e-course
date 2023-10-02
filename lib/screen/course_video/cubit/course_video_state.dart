part of 'course_video_cubit.dart';

enum CourseVideoStatus { isEmpty, isLoading, isNotEmpty }

class CourseVideoState extends Equatable {
  const CourseVideoState({
    required this.videoUrl,
    required this.section,
    required this.title,
    required this.course,
    required this.status,
  });
  final String videoUrl;
  final String section;
  final String title;
  final Course course;
  final CourseVideoStatus status;

  CourseVideoState copyWith({
    String? videoUrl,
    String? section,
    String? title,
    String? comment,
    Course? course,
    CourseVideoStatus? status,
  }) {
    return CourseVideoState(
      videoUrl: videoUrl ?? this.videoUrl,
      section: section ?? this.section,
      title: title ?? this.title,
      course: course ?? this.course,
      status: status ?? this.status,
    );
  }

  factory CourseVideoState.initial() {
    return CourseVideoState(
      videoUrl: "",
      section: "",
      title: "",
      course: Course.initialCourse(),
      status: CourseVideoStatus.isLoading,
    );
  }

  @override
  List<Object> get props => [videoUrl, section, title, status];
}
