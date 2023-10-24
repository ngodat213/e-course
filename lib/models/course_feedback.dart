// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CourseFeedback extends Equatable {
  final String uid;
  final String userId;
  final String time;
  final double ratting;
  final String feedback;
  const CourseFeedback({
    required this.uid,
    required this.userId,
    required this.time,
    required this.ratting,
    required this.feedback,
  });

  CourseFeedback copyWith({
    String? uid,
    String? userId,
    String? time,
    double? ratting,
    String? feedback,
  }) {
    return CourseFeedback(
      uid: uid ?? this.uid,
      userId: userId ?? this.userId,
      time: time ?? this.time,
      ratting: ratting ?? this.ratting,
      feedback: feedback ?? this.feedback,
    );
  }

  factory CourseFeedback.fromDoc(DocumentSnapshot feedbackCourseDoc) {
    final feedbackCoursData = feedbackCourseDoc.data() as Map<String, dynamic>?;

    return CourseFeedback(
      uid: feedbackCourseDoc.id,
      userId: feedbackCoursData!['teacher_id'],
      time: feedbackCoursData['time'],
      ratting: feedbackCoursData['ratting'],
      feedback: feedbackCoursData['feedback'],
    );
  }
  factory CourseFeedback.initialCourse() {
    return const CourseFeedback(
      uid: '',
      userId: '',
      time: '',
      ratting: 0,
      feedback: '',
    );
  }

  @override
  List<Object> get props {
    return [
      uid,
      userId,
      time,
      ratting,
      feedback,
    ];
  }
}
