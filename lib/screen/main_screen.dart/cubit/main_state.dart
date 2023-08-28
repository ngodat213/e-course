// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'main_cubit.dart';

class MainState extends Equatable {
  final int pageIndex;
  const MainState({
    required this.pageIndex,
  });

  factory MainState.initial() {
    return const MainState(
      pageIndex: 0,
    );
  }

  MainState copyWith({
    int? pageIndex,
  }) {
    return MainState(
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }

  @override
  List<Object> get props => [pageIndex];
}
