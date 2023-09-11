// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final String uid;
  final String teacherId;
  final String title;
  final String description;
  final String time;
  final List<String> listLesson;
  final String category;
  final double ratting;
  final List<String> listFeedBack;

  const Course({
    required this.uid,
    required this.teacherId,
    required this.title,
    required this.description,
    required this.time,
    required this.listLesson,
    required this.category,
    required this.ratting,
    required this.listFeedBack,
  });

  factory Course.fromDoc(DocumentSnapshot courseDoc) {
    final courseData = courseDoc.data() as Map<String, dynamic>?;

    return Course(
      uid: courseDoc.id,
      teacherId: courseData!['teacher_id'],
      title: courseData['title'],
      time: courseData['time'],
      description: courseData['description'],
      listLesson: List.from(courseData['list_lesson']),
      category: courseData['category'],
      ratting: courseData['ratting'],
      listFeedBack: List.from(courseData['feed_back']),
    );
  }
  factory Course.initialCourse() {
    return const Course(
      uid: '',
      teacherId: '',
      title: '',
      time: '',
      description: '',
      listLesson: [],
      category: '',
      ratting: 0,
      listFeedBack: [],
    );
  }

  @override
  List<Object> get props {
    return [
      uid,
      teacherId,
      title,
      description,
      time,
      listLesson,
      category,
      ratting,
      listFeedBack,
    ];
  }

  Course copyWith({
    String? uid,
    String? teacherId,
    String? title,
    String? description,
    String? time,
    List<String>? listLesson,
    String? category,
    double? ratting,
    int? register,
    List<String>? feedBack,
  }) {
    return Course(
      uid: uid ?? this.uid,
      teacherId: teacherId ?? this.teacherId,
      title: title ?? this.title,
      description: description ?? this.description,
      time: time ?? this.time,
      listLesson: listLesson ?? this.listLesson,
      category: category ?? this.category,
      ratting: ratting ?? this.ratting,
      listFeedBack: feedBack ?? listFeedBack,
    );
  }
}
