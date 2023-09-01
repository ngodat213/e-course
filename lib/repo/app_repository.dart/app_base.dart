import 'package:quiz_flutter/models/models.dart';

abstract class AppBase {
  /*--------------------------------- Product --------------------------------*/
  Future<List<Quiz>> getQuizByLimit(int limit);

  Future<QuizLesson> getLessonById(String lessonId);

  Future<Question> getQuestionById(String questionId);
}
