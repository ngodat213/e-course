// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class VideoCourse extends Equatable {
  final String uid;
  final String title;
  final String description;
  final String imgVideo;
  final String part;
  final String video;

  const VideoCourse({
    required this.uid,
    required this.title,
    required this.description,
    required this.imgVideo,
    required this.part,
    required this.video,
  });

  factory VideoCourse.fromDoc(DocumentSnapshot videoCourseDoc) {
    final videoCourseData = videoCourseDoc.data() as Map<String, dynamic>?;

    return VideoCourse(
      uid: videoCourseDoc.id,
      title: videoCourseData!['title'],
      description: videoCourseData['description'],
      imgVideo: videoCourseData['imgVideo'],
      part: videoCourseData['part'],
      video: videoCourseData['video'],
    );
  }

  factory VideoCourse.initialUser() {
    return const VideoCourse(
      uid: '',
      title: '',
      description: '',
      imgVideo: '',
      part: '',
      video: '',
    );
  }

  @override
  List<Object?> get props {
    return [
      uid,
      title,
      description,
      imgVideo,
      part,
      video,
    ];
  }

  VideoCourse copyWith({
    String? uid,
    String? title,
    String? description,
    String? imgVideo,
    String? part,
    String? video,
  }) {
    return VideoCourse(
      uid: uid ?? this.uid,
      title: title ?? this.title,
      description: description ?? this.description,
      imgVideo: imgVideo ?? this.imgVideo,
      part: part ?? this.part,
      video: video ?? this.video,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'title': title,
      'description': description,
      'imgVideo': imgVideo,
      'part': part,
      'video': video,
    };
  }

  factory VideoCourse.fromMap(Map<String, dynamic> map) {
    return VideoCourse(
      uid: map['uid'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      imgVideo: map['imgVideo'] as String,
      part: map['part'] as String,
      video: map['video'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoCourse.fromJson(String source) =>
      VideoCourse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
