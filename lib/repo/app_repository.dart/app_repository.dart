import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_flutter/configs/api_path.dart';
import 'package:quiz_flutter/models/course_lesson.dart';
import 'package:quiz_flutter/models/models.dart';
import 'package:quiz_flutter/repo/app_repository.dart/app_base.dart';

class AppRepository implements AppBase {
  final FirebaseFirestore firebaseFirestore;

  AppRepository({FirebaseFirestore? firebaseFirestore})
      : firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<List<Quiz>> getQuizByLimit(int limit) async {
    List<Quiz> list = [];
    try {
      await firebaseFirestore
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
        code: 'Exception',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  @override
  Future<QuizLesson> getLessonById(String lessonId) async {
    try {
      final lessonDoc = await firebaseFirestore
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
        code: 'Exception get Lesson',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  @override
  Future<Question> getQuestionById(String questionId) async {
    try {
      final lessonDoc = await firebaseFirestore
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
        code: 'Exception getQuestion',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  @override
  Future<List<Course>> getCourseByLimit(int limit) async {
    List<Course> list = [];
    try {
      await firebaseFirestore
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
        code: 'Exception',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  @override
  Future<CourseLesson> getCourseLessonById(String lessonId) async {
    try {
      final lessonDoc = await firebaseFirestore
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
        code: 'Exception getQuestion',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  @override
  Future<CourseVideo> getCourseVideoById(String videoId) async {
    try {
      final videoDoc = await firebaseFirestore
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
        code: 'Exception getQuestion',
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
        code: 'Exception getQuestion',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }
}
