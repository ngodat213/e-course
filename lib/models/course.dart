// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final String uid;
  final String teacher;
  final String thumb;
  final String title;
  final String description;
  final String time;
  final List<String> listLesson;
  final String category;
  final double ratting;
  final List<String> listFeedBack;
  final int register;
  final String video;

  const Course({
    required this.uid,
    required this.teacher,
    required this.thumb,
    required this.title,
    required this.description,
    required this.time,
    required this.listLesson,
    required this.category,
    required this.ratting,
    required this.listFeedBack,
    required this.register,
    required this.video,
  });

  factory Course.fromDoc(DocumentSnapshot courseDoc) {
    final courseData = courseDoc.data() as Map<String, dynamic>?;

    return Course(
        uid: courseDoc.id,
        teacher: courseData!['teacher'],
        thumb: courseData['thumb'],
        title: courseData['title'],
        time: courseData['time'],
        description: courseData['description'],
        listLesson: List.from(courseData['list_lesson']),
        category: courseData['category'],
        ratting: courseData['ratting'],
        listFeedBack: List.from(courseData['feed_back']),
        register: courseData['register'],
        video: courseData['video']);
  }
  factory Course.initialCourse() {
    return const Course(
        uid: '',
        teacher: '',
        thumb: '',
        title: '',
        time: '',
        description: '',
        listLesson: [],
        category: '',
        ratting: 0,
        listFeedBack: [],
        register: 0,
        video: '');
  }

  @override
  List<Object> get props {
    return [
      uid,
      teacher,
      thumb,
      title,
      description,
      time,
      listLesson,
      category,
      ratting,
      listFeedBack,
      register,
      video,
    ];
  }

  Course copyWith({
    String? uid,
    String? teacher,
    String? thumb,
    String? title,
    String? description,
    String? time,
    List<String>? listLesson,
    String? category,
    double? ratting,
    List<String>? listFeedBack,
    int? register,
    String? video,
  }) {
    return Course(
      uid: uid ?? this.uid,
      teacher: teacher ?? this.teacher,
      thumb: thumb ?? this.thumb,
      title: title ?? this.title,
      description: description ?? this.description,
      time: time ?? this.time,
      listLesson: listLesson ?? this.listLesson,
      category: category ?? this.category,
      ratting: ratting ?? this.ratting,
      listFeedBack: listFeedBack ?? this.listFeedBack,
      register: register ?? this.register,
      video: video ?? this.video,
    );
  }
}
