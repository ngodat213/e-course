import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState.initial());

  void indexChanged(int value) {
    emit(
      state.copyWith(
        pageIndex: value,
      ),
    );
  }
}
