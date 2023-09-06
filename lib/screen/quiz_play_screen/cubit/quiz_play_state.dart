part of 'quiz_play_cubit.dart';

enum QuestionStatus { isEmpty, isLoading, isNotEmpty, commit, result }

class QuizPlayState extends Equatable {
  const QuizPlayState({
    required this.lesson,
    required this.index,
    required this.questions,
    required this.status,
    required this.userChooise,
    required this.userCorrect,
  });
  final QuizLesson lesson;
  final int index;
  final List<Question> questions;
  final QuestionStatus status;
  final List<int> userChooise;
  final int userCorrect;

  QuizPlayState copyWith({
    QuizLesson? lesson,
    int? index,
    List<Question>? questions,
    QuestionStatus? status,
    List<int>? userChooise,
    int? userCorrect,
  }) {
    return QuizPlayState(
        lesson: lesson ?? this.lesson,
        index: index ?? this.index,
        questions: questions ?? this.questions,
        status: status ?? this.status,
        userChooise: userChooise ?? this.userChooise,
        userCorrect: userCorrect ?? this.userCorrect);
  }

  factory QuizPlayState.initial() {
    return QuizPlayState(
      lesson: QuizLesson.initialQuiz(),
      index: 0,
      questions: const [],
      userChooise: const [],
      userCorrect: 0,
      status: QuestionStatus.isLoading,
    );
  }

  @override
  List<Object> get props =>
      [lesson, index, questions, userChooise, userChooise, status];
}
