// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Quiz extends Equatable {
  final String uid;
  final String title;
  final String image;
  final String description;
  final String type;
  final List<String> lessons;

  const Quiz({
    required this.uid,
    required this.title,
    required this.image,
    required this.description,
    required this.type,
    required this.lessons,
  });

  factory Quiz.fromDoc(DocumentSnapshot quizDoc) {
    final quizData = quizDoc.data() as Map<String, dynamic>?;

    return Quiz(
      uid: quizDoc.id,
      title: quizData!['title'],
      image: quizData['image'],
      description: quizData['description'],
      type: quizData['type'],
      lessons: List.from(quizData['lessons']),
    );
  }

  factory Quiz.initialQuiz() {
    return const Quiz(
      uid: '',
      title: '',
      image: '',
      description: '',
      type: '',
      lessons: [],
    );
  }

  @override
  List<Object?> get props {
    return [
      uid,
      title,
      image,
      description,
      lessons,
    ];
  }

  Quiz copyWith({
    String? uid,
    String? title,
    String? image,
    String? description,
    String? type,
    List<String>? lessons,
  }) {
    return Quiz(
      uid: uid ?? this.uid,
      title: title ?? this.title,
      image: image ?? this.image,
      description: description ?? this.description,
      type: type ?? this.type,
      lessons: lessons ?? this.lessons,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'title': title,
      'image': image,
      'description': description,
      'lessons': lessons,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;
}
