// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CourseLesson extends Equatable {
  final String uid;
  final int selection;
  final String title;
  final List<String> listCourseVideo;

  const CourseLesson({
    required this.uid,
    required this.selection,
    required this.title,
    required this.listCourseVideo,
  });

  CourseLesson copyWith({
    String? uid,
    int? selection,
    String? title,
    List<String>? listCourseVideo,
  }) {
    return CourseLesson(
      uid: uid ?? this.uid,
      selection: selection ?? this.selection,
      title: title ?? this.title,
      listCourseVideo: listCourseVideo ?? this.listCourseVideo,
    );
  }

  factory CourseLesson.fromDoc(DocumentSnapshot lessonCourseDoc) {
    final lessonCourseData = lessonCourseDoc.data() as Map<String, dynamic>?;

    return CourseLesson(
      uid: lessonCourseDoc.id,
      title: lessonCourseData!['title'],
      selection: lessonCourseData['selection'],
      listCourseVideo: List.from(lessonCourseData['listCourseVideo']),
    );
  }

  factory CourseLesson.initialUser() {
    return const CourseLesson(
      uid: '',
      title: '',
      selection: 0,
      listCourseVideo: [],
    );
  }

  @override
  List<Object?> get props => [uid, selection, title, listCourseVideo];
}
