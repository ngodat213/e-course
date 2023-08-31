// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Quiz extends Equatable {
  final String uid;
  final String title;
  final String image;
  final String description;
  final double price;
  final double? discount;
  final List<String> lessons;

  const Quiz({
    required this.uid,
    required this.title,
    required this.image,
    required this.description,
    required this.price,
    this.discount,
    required this.lessons,
  });

  factory Quiz.fromDoc(DocumentSnapshot quizDoc) {
    final quizData = quizDoc.data() as Map<String, dynamic>?;

    return Quiz(
      uid: quizDoc.id,
      title: quizData!['title'],
      image: quizData['image'],
      description: quizData['description'],
      price: quizData['price'],
      discount: quizData['discount'],
      lessons: quizData['lessons'],
    );
  }

  factory Quiz.initialUser() {
    return const Quiz(
      uid: '',
      title: '',
      image: '',
      description: '',
      price: 0,
      discount: 0,
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
      price,
      discount,
      lessons,
    ];
  }

  Quiz copyWith({
    String? uid,
    String? title,
    String? image,
    String? description,
    double? price,
    double? discount,
    List<String>? lessons,
  }) {
    return Quiz(
      uid: uid ?? this.uid,
      title: title ?? this.title,
      image: image ?? this.image,
      description: description ?? this.description,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      lessons: lessons ?? this.lessons,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'title': title,
      'image': image,
      'description': description,
      'price': price,
      'discount': discount,
      'lessons': lessons,
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      uid: map['uid'] as String,
      title: map['title'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      discount: map['discount'] != null ? map['discount'] as double : null,
      lessons: List<String>.from((map['lessons'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Quiz.fromJson(String source) =>
      Quiz.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
