import 'package:quiz_flutter/models/course_lesson.dart';
import 'package:quiz_flutter/models/models.dart';

abstract class AppBase {
  /*--------------------------------- Product --------------------------------*/
  Future<List<Quiz>> getQuizByLimit(int limit);

  Future<QuizLesson> getLessonById(String lessonId);

  Future<Question> getQuestionById(String questionId);

  Future<List<Course>> getCourseByLimit(int limit);

  Future<CourseLesson> getCourseLessonById(String lessonId);

  Future<CourseVideo> getCourseVideoById(String lessonId);
}
