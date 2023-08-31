import 'package:quiz_flutter/models/quiz.dart';

abstract class AppBase {
  /*--------------------------------- Product --------------------------------*/
  Future<List<Quiz>> getQuizByLimit(int limit);
}
