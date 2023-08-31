// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Teacher extends Equatable {
  final String uid;
  final String teacherUid;
  final List<String> teacherCourse;

  const Teacher({
    required this.uid,
    required this.teacherUid,
    required this.teacherCourse,
  });

  @override
  List<Object> get props => [uid, teacherUid, teacherCourse];

  Teacher copyWith({
    String? uid,
    String? teacherUid,
    List<String>? teacherCourse,
  }) {
    return Teacher(
      uid: uid ?? this.uid,
      teacherUid: teacherUid ?? this.teacherUid,
      teacherCourse: teacherCourse ?? this.teacherCourse,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'teacherUid': teacherUid,
      'teacherCourse': teacherCourse,
    };
  }

  factory Teacher.fromMap(Map<String, dynamic> map) {
    return Teacher(
      uid: map['uid'] as String,
      teacherUid: map['teacherUid'] as String,
      teacherCourse: List<String>.from((map['teacherCourse'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Teacher.fromJson(String source) =>
      Teacher.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
