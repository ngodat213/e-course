part of 'favorite_screen_cubit.dart';

enum FavoriteScreenStatus { isEmpty, isLoading, isNotEmpty }

class FavoriteScreenState extends Equatable {
  const FavoriteScreenState({required this.courses, required this.status});

  final List<Course> courses;
  final FavoriteScreenStatus status;

  FavoriteScreenState copyWith({
    List<Course>? courses,
    FavoriteScreenStatus? status,
  }) {
    return FavoriteScreenState(
      courses: courses ?? this.courses,
      status: status ?? this.status,
    );
  }

  factory FavoriteScreenState.initial() {
    return const FavoriteScreenState(
      courses: [],
      status: FavoriteScreenStatus.isLoading,
    );
  }

  @override
  List<Object> get props => [courses, status];
}
