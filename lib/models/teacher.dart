// ignore_for_file: public_member_api_docs, sort_constructors_first

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
}
