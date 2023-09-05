part of 'quiz_play_cubit.dart';

enum QuestionStatus { isEmpty, isLoading, isNotEmpty }

class QuizPlayState extends Equatable {
  const QuizPlayState(
      {required this.lesson, required this.questions, required this.status});
  final QuizLesson lesson;
  final List<Question> questions;
  final QuestionStatus status;

  QuizPlayState copyWith({
    QuizLesson? lesson,
    List<Question>? questions,
    QuestionStatus? status,
  }) {
    return QuizPlayState(
      lesson: lesson ?? this.lesson,
      questions: questions ?? this.questions,
      status: status ?? this.status,
    );
  }

  factory QuizPlayState.initial() {
    return QuizPlayState(
      lesson: QuizLesson.initialQuiz(),
      questions: const [],
      status: QuestionStatus.isLoading,
    );
  }

  @override
  List<Object> get props => [lesson, questions, status];
}
