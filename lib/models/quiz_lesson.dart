// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class QuizLesson extends Equatable {
  final String uid;
  final String lesson;
  final String title;
  final List<String> questions;
  final int hour;
  final int minute;
  final int second;
  final int point;
  const QuizLesson({
    required this.uid,
    required this.lesson,
    required this.title,
    required this.questions,
    required this.hour,
    required this.minute,
    required this.second,
    required this.point,
  });

  QuizLesson copyWith({
    String? uid,
    String? lesson,
    String? title,
    List<String>? questions,
    int? hour,
    int? minute,
    int? point,
    int? second,
  }) {
    return QuizLesson(
      uid: uid ?? this.uid,
      lesson: lesson ?? this.lesson,
      title: title ?? this.title,
      questions: questions ?? this.questions,
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      point: point ?? this.point,
      second: second ?? this.second,
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
      point: 0,
      second: 0,
    );
  }

  factory QuizLesson.fromDoc(DocumentSnapshot lessonQuizDoc) {
    final quizLessonData = lessonQuizDoc.data() as Map<String, dynamic>?;

    return QuizLesson(
      uid: lessonQuizDoc.id,
      lesson: quizLessonData!['lesson'],
      title: quizLessonData['title'],
      questions: List.from(quizLessonData['questions']),
      hour: quizLessonData['hour'],
      minute: quizLessonData['minute'],
      point: quizLessonData['point'],
      second: quizLessonData['second'],
    );
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
      second,
    ];
  }
}
