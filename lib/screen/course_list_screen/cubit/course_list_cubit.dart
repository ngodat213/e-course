import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'course_list_state.dart';

class CourseListCubit extends Cubit<CourseListState> {
  CourseListCubit() : super(CourseListInitial());
}
