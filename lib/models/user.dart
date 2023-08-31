// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String? email;
  final String? displayName;
  final String? photoUrl;
  final int? diamond;
  final List<String>? favoritesCourse;
  final List<String>? favoritesTeacher;
  final List<String>? course;

  const User({
    required this.uid,
    this.email,
    this.displayName,
    this.photoUrl,
    this.diamond,
    this.favoritesCourse,
    this.favoritesTeacher,
    this.course,
  });

  factory User.fromDoc(DocumentSnapshot userDoc) {
    final userData = userDoc.data() as Map<String, dynamic>?;

    return User(
      uid: userDoc.id,
      displayName: userData!['name'],
      email: userData['email'],
      photoUrl: userData['profileImage'],
      diamond: userData['diamond'],
      favoritesTeacher: List.from(userData['favorites_teacher']),
      favoritesCourse: List.from(userData['favorites_course']),
      course: List.from(userData['course']),
    );
  }

  factory User.initialUser() {
    return const User(
      uid: '',
      displayName: '',
      email: '',
      photoUrl: '',
      diamond: 0,
      favoritesTeacher: [],
      favoritesCourse: [],
      course: [],
    );
  }

  static const empty = User(uid: '');

  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props {
    return [
      uid,
      email,
      displayName,
      photoUrl,
      diamond,
      favoritesCourse,
      favoritesTeacher,
      course,
    ];
  }

  User copyWith({
    String? uid,
    String? email,
    String? displayName,
    String? photoUrl,
    int? diamond,
    List<String>? favoritesCourse,
    List<String>? favoritesTeacher,
    List<String>? course,
  }) {
    return User(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      diamond: diamond ?? this.diamond,
      favoritesCourse: favoritesCourse ?? this.favoritesCourse,
      favoritesTeacher: favoritesTeacher ?? this.favoritesTeacher,
      course: course ?? this.course,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'diamond': diamond,
      'favoritesCourse': favoritesCourse,
      'favoritesTeacher': favoritesTeacher,
      'course': course,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] as String,
      email: map['email'] != null ? map['email'] as String : null,
      displayName:
          map['displayName'] != null ? map['displayName'] as String : null,
      photoUrl: map['photoUrl'] != null ? map['photoUrl'] as String : null,
      diamond: map['diamond'] != null ? map['diamond'] as int : null,
      favoritesCourse: map['favoritesCourse'] != null
          ? List<String>.from((map['favoritesCourse'] as List<String>))
          : null,
      favoritesTeacher: map['favoritesTeacher'] != null
          ? List<String>.from((map['favoritesTeacher'] as List<String>))
          : null,
      course: map['course'] != null
          ? List<String>.from((map['course'] as List<String>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
