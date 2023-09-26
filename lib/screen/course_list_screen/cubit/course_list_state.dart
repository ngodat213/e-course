part of 'course_list_cubit.dart';

sealed class CourseListState extends Equatable {
  const CourseListState();

  @override
  List<Object> get props => [];
}

final class CourseListInitial extends CourseListState {}
