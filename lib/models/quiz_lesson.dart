// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class QuizLesson extends Equatable {
  final String uid;
  final String lesson;
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
    String? lesson,
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

  factory QuizLesson.initialQuiz() {
    return const QuizLesson(
      uid: '',
      lesson: '',
      title: '',
      questions: [],
      hour: 0,
      minute: 0,
    );
  }

  factory QuizLesson.fromDoc(DocumentSnapshot lessonDoc) {
    final quizLessonData = lessonDoc.data() as Map<String, dynamic>?;

    return QuizLesson(
      uid: lessonDoc.id,
      lesson: quizLessonData!['lesson'],
      title: quizLessonData['title'],
      questions: List.from(quizLessonData['questions']),
      hour: quizLessonData['hour'],
      minute: quizLessonData['minute'],
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

  String toJson() => json.encode(toMap());

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
  List<Object> get props {
    return [
      uid,
      lesson,
      title,
      questions,
      hour,
      minute,
    ];
  }

  @override
  bool get stringify => true;
}
