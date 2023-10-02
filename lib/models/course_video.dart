// ignore_for_file: public_member_api_docs, sort_constructors_first

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

  const CourseVideo({
    required this.uid,
    required this.title,
    required this.part,
    required this.video,
    required this.description,
    required this.hour,
    required this.minute,
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
    );
  }

  factory CourseVideo.initialUser() {
    return const CourseVideo(
      uid: '',
      title: '',
      part: '',
      video: '',
      description: '',
      hour: 0,
      minute: 0,
    );
  }
  CourseVideo copyWith({
    String? uid,
    String? title,
    String? imgVideo,
    String? part,
    String? video,
    String? description,
    int? hour,
    int? minute,
    bool? view,
  }) {
    return CourseVideo(
      uid: uid ?? this.uid,
      title: title ?? this.title,
      part: part ?? this.part,
      video: video ?? this.video,
      hour: hour ?? this.hour,
      description: description ?? this.description,
      minute: minute ?? this.minute,
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
    ];
  }
}
