// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class QuizLesson extends Equatable {
  final String uid;
  final int lesson;
  final String title;
  final List<String> questions;
  final int hour;
  final int minute;
  const QuizLesson({
    required this.uid,
    required this.lesson,
    required this.title,
    required this.questions,
    required this.hour,
    required this.minute,
  });

  QuizLesson copyWith({
    String? uid,
    int? lesson,
    String? title,
    List<String>? questions,
    int? hour,
    int? minute,
  }) {
    return QuizLesson(
      uid: uid ?? this.uid,
      lesson: lesson ?? this.lesson,
      title: title ?? this.title,
      questions: questions ?? this.questions,
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'lesson': lesson,
      'title': title,
      'questions': questions,
      'hour': hour,
      'minute': minute,
    };
  }

  factory QuizLesson.fromMap(Map<String, dynamic> map) {
    return QuizLesson(
      uid: map['uid'] as String,
      lesson: map['lesson'] as int,
      title: map['title'] as String,
      questions: List<String>.from((map['questions'] as List<String>)),
      hour: map['hour'] as int,
      minute: map['minute'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizLesson.fromJson(String source) =>
      QuizLesson.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuizLesson(uid: $uid, lesson: $lesson, title: $title, questions: $questions, hour: $hour, minute: $minute)';
  }

  @override
  bool operator ==(covariant QuizLesson other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.lesson == lesson &&
        other.title == title &&
        listEquals(other.questions, questions) &&
        other.hour == hour &&
        other.minute == minute;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        lesson.hashCode ^
        title.hashCode ^
        questions.hashCode ^
        hour.hashCode ^
        minute.hashCode;
  }

  @override
  List<Object?> get props => [uid, lesson, title, questions, hour, minute];
}
