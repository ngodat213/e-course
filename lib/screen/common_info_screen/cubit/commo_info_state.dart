// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'commo_info_cubit.dart';

enum CommoInfoStatus { initial, submitting, success, error }

class CommoInfoState extends Equatable {
  const CommoInfoState({
    required this.fullName,
    required this.email,
    required this.topic,
    required this.text,
    required this.initialIndex,
    required this.status,
  });

  final String fullName;
  final String email;
  final String topic;
  final String text;
  final int initialIndex;
  final CommoInfoStatus status;

  factory CommoInfoState.initial() {
    return const CommoInfoState(
      fullName: '',
      email: '',
      topic: '',
      text: '',
      initialIndex: 1,
      status: CommoInfoStatus.initial,
    );
  }

  CommoInfoState copyWith({
    String? fullName,
    String? email,
    String? topic,
    String? text,
    int? initialIndex,
    CommoInfoStatus? status,
  }) {
    return CommoInfoState(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      topic: topic ?? this.topic,
      text: text ?? this.text,
      initialIndex: initialIndex ?? this.initialIndex,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props {
    return [fullName, email, topic, text, initialIndex];
  }
}
