// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Question extends Equatable {
  final String uid;
  final String question;
  final List<String> options;
  final int answer;
  String? imagePath;

  Question({
    required this.uid,
    required this.question,
    required this.options,
    required this.answer,
    this.imagePath,
  });

  factory Question.fromDoc(DocumentSnapshot questionDoc) {
    final questionData = questionDoc.data() as Map<String, dynamic>?;

    return Question(
      uid: questionDoc.id,
      question: questionData!['question'],
      options: List.from(questionData['options']),
      answer: questionData['answer'],
      imagePath: questionData['image'],
    );
  }

  factory Question.initialUser() {
    return Question(
      uid: '',
      question: '',
      options: const [],
      answer: 0,
      imagePath: "",
    );
  }

  Question copyWith({
    String? uid,
    String? question,
    List<String>? options,
    int? answer,
    String? imagePath,
  }) {
    return Question(
      uid: uid ?? this.uid,
      question: question ?? this.question,
      options: options ?? this.options,
      answer: answer ?? this.answer,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  @override
  List<Object?> get props => [uid, question, options, answer, imagePath];
}
