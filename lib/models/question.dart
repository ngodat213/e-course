// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  @override
  List<Object?> get props => [uid, question, options, answer];

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'question': question,
      'options': options,
      'answer': answer,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      uid: map['uid'] as String,
      question: map['question'] as String,
      options: List<String>.from((map['options'] as List<String>)),
      answer: map['answer'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
