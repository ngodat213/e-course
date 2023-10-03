import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CourseVideo extends Equatable {
  final String uid;
  final String title;
  final String part;
  final String video;
  final String description;
  final int hour;
  final int minute;
  final List<String> comment;

  const CourseVideo({
    required this.uid,
    required this.title,
    required this.part,
    required this.video,
    required this.description,
    required this.hour,
    required this.minute,
    required this.comment,
  });

  factory CourseVideo.fromDoc(DocumentSnapshot videoCourseDoc) {
    final videoCourseData = videoCourseDoc.data() as Map<String, dynamic>?;

    return CourseVideo(
      uid: videoCourseDoc.id,
      title: videoCourseData!['title'],
      part: videoCourseData['part'],
      video: videoCourseData['video'],
      description: videoCourseData['description'],
      hour: videoCourseData['hour'],
      minute: videoCourseData['minute'],
      comment: List.from(videoCourseData['comment']),
    );
  }

  factory CourseVideo.initialCourseVideo() {
    return const CourseVideo(
      uid: '',
      title: '',
      part: '',
      video: '',
      description: '',
      hour: 0,
      minute: 0,
      comment: [],
    );
  }
  CourseVideo copyWith({
    String? uid,
    String? title,
    String? part,
    String? video,
    String? description,
    int? hour,
    int? minute,
    List<String>? comment,
  }) {
    return CourseVideo(
      uid: uid ?? this.uid,
      title: title ?? this.title,
      part: part ?? this.part,
      video: video ?? this.video,
      hour: hour ?? this.hour,
      description: description ?? this.description,
      minute: minute ?? this.minute,
      comment: comment ?? this.comment,
    );
  }

  @override
  List<Object?> get props {
    return [
      uid,
      title,
      part,
      video,
      description,
      hour,
      minute,
      comment,
    ];
  }
}
