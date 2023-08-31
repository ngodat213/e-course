// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final String uid;
  final String teacherId;
  final String title;
  final String time;
  final int lesson;
  final double price;
  final double? discount;
  final String description;
  final List<String> listLesson;
  final String category;
  final List<String>? feedBack;

  const Course({
    required this.uid,
    required this.teacherId,
    required this.title,
    required this.time,
    required this.lesson,
    required this.price,
    this.discount,
    required this.description,
    required this.listLesson,
    required this.category,
    this.feedBack,
  });

  factory Course.fromDoc(DocumentSnapshot userDoc) {
    final userData = userDoc.data() as Map<String, dynamic>?;

    return Course(
      uid: userDoc.id,
      teacherId: userData!['teacher_id'],
      title: userData['title'],
      time: userData['time'],
      lesson: userData['lesson'],
      price: userData['price'],
      discount: userData['discount'],
      description: userData['description'],
      listLesson: List.from(userData['list_lesson']),
      category: userData['category'],
      feedBack: List.from(userData['feed_back']),
    );
  }
  factory Course.initialUser() {
    return const Course(
      uid: '',
      teacherId: '',
      title: '',
      time: '',
      lesson: 0,
      price: 0,
      discount: 0,
      description: '',
      listLesson: [],
      category: '',
      feedBack: [],
    );
  }

  @override
  List<Object?> get props {
    return [
      uid,
      teacherId,
      title,
      time,
      lesson,
      price,
      discount,
      description,
      listLesson,
      category,
      feedBack,
    ];
  }

  Course copyWith({
    String? uid,
    String? teacherId,
    String? title,
    String? time,
    int? lesson,
    double? price,
    double? discount,
    String? description,
    List<String>? listLesson,
    String? category,
    List<String>? feedBack,
  }) {
    return Course(
      uid: uid ?? this.uid,
      teacherId: teacherId ?? this.teacherId,
      title: title ?? this.title,
      time: time ?? this.time,
      lesson: lesson ?? this.lesson,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      description: description ?? this.description,
      listLesson: listLesson ?? this.listLesson,
      category: category ?? this.category,
      feedBack: feedBack ?? this.feedBack,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'teacherId': teacherId,
      'title': title,
      'time': time,
      'lesson': lesson,
      'price': price,
      'discount': discount,
      'description': description,
      'listLesson': listLesson,
      'category': category,
      'feedBack': feedBack,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      uid: map['uid'] as String,
      teacherId: map['teacherId'] as String,
      title: map['title'] as String,
      time: map['time'] as String,
      lesson: map['lesson'] as int,
      price: map['price'] as double,
      discount: map['discount'] != null ? map['discount'] as double : null,
      description: map['description'] as String,
      listLesson: List<String>.from((map['listLesson'] as List<String>)),
      category: map['category'] as String,
      feedBack: map['feedBack'] != null
          ? List<String>.from((map['feedBack'] as List<String>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) =>
      Course.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
