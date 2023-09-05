part of 'quiz_play_cubit.dart';

enum QuestionStatus { isEmpty, isLoading, isNotEmpty }

class QuizPlayState extends Equatable {
  const QuizPlayState(
      {required this.lesson,
      required this.index,
      required this.questions,
      required this.status});
  final QuizLesson lesson;
  final int index;
  final List<Question> questions;
  final QuestionStatus status;

  QuizPlayState copyWith({
    QuizLesson? lesson,
    int? index,
    List<Question>? questions,
    QuestionStatus? status,
  }) {
    return QuizPlayState(
      lesson: lesson ?? this.lesson,
      index: index ?? this.index,
      questions: questions ?? this.questions,
      status: status ?? this.status,
    );
  }

  factory QuizPlayState.initial() {
    return QuizPlayState(
      lesson: QuizLesson.initialQuiz(),
      index: 0,
      questions: const [],
      status: QuestionStatus.isLoading,
    );
  }

  @override
  List<Object> get props => [lesson, questions, status];
}
