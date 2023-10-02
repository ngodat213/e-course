import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_flutter/configs/api_path.dart';
import 'package:quiz_flutter/manager/manager_key_storage.dart';
import 'package:quiz_flutter/models/comment.dart';
import 'package:quiz_flutter/models/course_lesson.dart';
import 'package:quiz_flutter/models/models.dart';
import 'package:quiz_flutter/repo/app_repository.dart/app_base.dart';
import 'package:quiz_flutter/utils/base_shared_preferences.dart';

class AppRepository implements AppBase {
  final FirebaseFirestore _firebaseFirestore;

  AppRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<List<Quiz>> getQuizByLimit(int limit) async {
    List<Quiz> list = [];
    try {
      await _firebaseFirestore
          .collection(ApiPath.QUIZ)
          .limit(limit)
          .get()
          .then((value) {
        for (var element in value.docs) {
          list.add(Quiz.fromDoc(element));
        }
      });
      if (list.isNotEmpty) {
        return list;
      }
      throw 'Quiz is empty';
    } on FirebaseException catch (e) {
      throw CustomError(code: e.code, msg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception getQuizByLimit',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  @override
  Future<QuizLesson> getLessonById(String lessonId) async {
    try {
      final lessonDoc = await _firebaseFirestore
          .collection(ApiPath.LESSON)
          .doc(lessonId)
          .get();
      if (lessonDoc.exists) {
        return QuizLesson.fromDoc(lessonDoc);
      }
      throw ("Lesson is empty!");
    } on FirebaseException catch (e) {
      throw CustomError(code: e.code, msg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception getLessonById',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  @override
  Future<Question> getQuestionById(String questionId) async {
    try {
      final lessonDoc = await _firebaseFirestore
          .collection(ApiPath.QUESTION)
          .doc(questionId)
          .get();
      if (lessonDoc.exists) {
        return Question.fromDoc(lessonDoc);
      }
      throw ("Question is empty!");
    } on FirebaseException catch (e) {
      throw CustomError(code: e.code, msg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception getQuestionById',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  @override
  Future<Course> getCourseById(String id) async {
    try {
      final courseDoc =
          await _firebaseFirestore.collection(ApiPath.COURSE).doc(id).get();
      if (courseDoc.exists) {
        return Course.fromDoc(courseDoc);
      }
      throw 'Course is empty';
    } on FirebaseException catch (e) {
      throw CustomError(code: e.code, msg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception getCourseById',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  @override
  Future<List<Course>> getCourseByLimit(int limit) async {
    List<Course> list = [];
    try {
      await _firebaseFirestore
          .collection(ApiPath.COURSE)
          .limit(limit)
          .get()
          .then((value) {
        for (var element in value.docs) {
          list.add(Course.fromDoc(element));
        }
      });
      if (list.isNotEmpty) {
        return list;
      }
      throw 'Course is empty';
    } on FirebaseException catch (e) {
      throw CustomError(code: e.code, msg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception getCourseByLimit',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  @override
  Future<List<Course>> getCourse() async {
    List<Course> list = [];
    try {
      await _firebaseFirestore.collection(ApiPath.COURSE).get().then((value) {
        for (var element in value.docs) {
          list.add(Course.fromDoc(element));
        }
      });
      if (list.isNotEmpty) {
        return list;
      }
      throw 'Course is empty';
    } on FirebaseException catch (e) {
      throw CustomError(code: e.code, msg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception getCourse',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  @override
  Future<CourseLesson> getCourseLessonById(String lessonId) async {
    try {
      final lessonDoc = await _firebaseFirestore
          .collection(ApiPath.COURSE_LESSON)
          .doc(lessonId)
          .get();
      if (lessonDoc.exists) {
        return CourseLesson.fromDoc(lessonDoc);
      }
      throw ("Question is empty!");
    } on FirebaseException catch (e) {
      throw CustomError(code: e.code, msg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception getCourseLessonById',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  @override
  Future<CourseVideo> getCourseVideoById(String videoId) async {
    try {
      final videoDoc = await _firebaseFirestore
          .collection(ApiPath.COURSE_VIDEO)
          .doc(videoId)
          .get();
      if (videoDoc.exists) {
        return CourseVideo.fromDoc(videoDoc);
      }
      throw ("Question is empty!");
    } on FirebaseException catch (e) {
      throw CustomError(code: e.code, msg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception getCourseVideoById',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  @override
  Future<void> setContactUs(
      String fullName, String mail, String topic, String text) async {
    try {
      await FirebaseFirestore.instance.collection(ApiPath.CONTACT).doc().set({
        'fullName': fullName,
        'mail': mail,
        'topic': topic,
        'text': text,
      });
    } on FirebaseException catch (e) {
      throw CustomError(code: e.code, msg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception setContactUs',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  @override
  Future<void> setCommentCollection(
      {required String videoId, required String title}) async {
    try {
      final userToken = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.accessToken);
      var commentRef = _firebaseFirestore.collection(ApiPath.COMMENT).doc();
      commentRef.set({
        'userId': userToken,
        'title': title,
        'like': 0,
        'feedback': [],
      }).then((_) {
        var documentId = commentRef.id;
        _firebaseFirestore
            .collection(ApiPath.COURSE_VIDEO)
            .doc(videoId)
            .update({
          "course": FieldValue.arrayUnion([documentId])
        });
      }).catchError((error) {
        throw ("setCommentCollection fail!");
      });
    } on FirebaseException catch (e) {
      throw CustomError(code: e.code, msg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception update course',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  @override
  Future<List<Comment>> getComment() async {
    List<Comment> list = [];
    try {
      await _firebaseFirestore.collection(ApiPath.COMMENT).get().then((value) {
        for (var element in value.docs) {
          list.add(Comment.fromDoc(element));
        }
      });
      if (list.isNotEmpty) {
        return list;
      }
      throw 'Comment is empty';
    } on FirebaseException catch (e) {
      throw CustomError(code: e.code, msg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception getComment',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }
}
