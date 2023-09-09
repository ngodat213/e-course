// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Question extends Equatable {
  final String uid;
  final String question;
  final List<String> options;
  final int answer;

  const Question({
    required this.uid,
    required this.question,
    required this.options,
    required this.answer,
  });

  factory Question.fromDoc(DocumentSnapshot questionDoc) {
    final questionData = questionDoc.data() as Map<String, dynamic>?;

    return Question(
      uid: questionDoc.id,
      question: questionData!['question'],
      options: List.from(questionData['options']),
      answer: questionData['answer'],
    );
  }

  factory Question.initialUser() {
    return const Question(
      uid: '',
      question: '',
      options: [],
      answer: 0,
    );
  }

  Question copyWith({
    String? uid,
    String? question,
    List<String>? options,
    int? answer,
  }) {
    return Question(
      uid: uid ?? this.uid,
      question: question ?? this.question,
      options: options ?? this.options,
      answer: answer ?? this.answer,
    );
  }

  @override
  List<Object?> get props => [uid, question, options, answer];
}
