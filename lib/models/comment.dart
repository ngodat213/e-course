// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Comment extends Equatable {
  final String uid;
  final int like;
  final String title;
  final String userId;
  final List<String> feedback;
  const Comment({
    required this.uid,
    required this.like,
    required this.title,
    required this.userId,
    required this.feedback,
  });

  factory Comment.fromDoc(DocumentSnapshot feedbackCourseDoc) {
    final feedbackCoursData = feedbackCourseDoc.data() as Map<String, dynamic>?;

    return Comment(
      uid: feedbackCourseDoc.id,
      like: feedbackCoursData!['like'],
      title: feedbackCoursData['title'],
      userId: feedbackCoursData['userId'],
      feedback: List.from(feedbackCoursData['feedback']),
    );
  }
  factory Comment.initialCourse() {
    return const Comment(
      uid: '',
      userId: '',
      like: 0,
      title: '',
      feedback: [],
    );
  }

  Comment copyWith({
    String? uid,
    int? like,
    String? title,
    String? userId,
    List<String>? feedback,
  }) {
    return Comment(
      uid: uid ?? this.uid,
      like: like ?? this.like,
      title: title ?? this.title,
      userId: userId ?? this.userId,
      feedback: feedback ?? this.feedback,
    );
  }

  @override
  List<Object> get props => [like, title, userId, feedback];
}
