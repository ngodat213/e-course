// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String? email;
  final String? displayName;
  final String? photoUrl;
  final String? phoneNumber;
  final List<String>? favoritesCourse;
  final List<String>? favoritesTeacher;
  final List<String>? course;

  const User({
    required this.uid,
    this.email,
    this.displayName,
    this.photoUrl,
    this.phoneNumber,
    this.favoritesCourse,
    this.favoritesTeacher,
    this.course,
  });

  factory User.fromDoc(DocumentSnapshot userDoc) {
    final userData = userDoc.data() as Map<String, dynamic>?;

    return User(
      uid: userDoc.id,
      displayName: userData!['displayName'],
      email: userData['email'],
      photoUrl: userData['photoUrl'],
      phoneNumber: userData['phoneNumber'],
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
      phoneNumber: '',
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
      phoneNumber,
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
    String? phoneNumber,
    List<String>? favoritesCourse,
    List<String>? favoritesTeacher,
    List<String>? course,
  }) {
    return User(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      favoritesCourse: favoritesCourse ?? this.favoritesCourse,
      favoritesTeacher: favoritesTeacher ?? this.favoritesTeacher,
      course: course ?? this.course,
    );
  }
}
