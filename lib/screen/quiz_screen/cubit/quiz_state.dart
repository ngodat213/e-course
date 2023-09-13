part of 'quiz_cubit.dart';

enum QuizStatus { isEmpty, isLoading, isNotEmpty }

class QuizState extends Equatable {
  const QuizState({
    required this.quiz,
    required this.lessons,
    required this.status,
  });
  final Quiz quiz;
  final List<QuizLesson> lessons;
  final QuizStatus status;

  QuizState copyWith({
    Quiz? quiz,
    List<QuizLesson>? lessons,
    QuizStatus? status,
  }) {
    return QuizState(
      quiz: quiz ?? this.quiz,
      lessons: lessons ?? this.lessons,
      status: status ?? this.status,
    );
  }

  factory QuizState.initial() {
    return QuizState(
      quiz: Quiz.initialQuiz(),
      lessons: const [],
      status: QuizStatus.isLoading,
    );
  }

  @override
  List<Object> get props => [quiz, lessons, status];
}
