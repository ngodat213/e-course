import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_flutter/repo/auth_repository.dart';
import 'package:quiz_flutter/widgets/custom_toast.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  final AuthRepository _authRepository;
  SettingCubit(this._authRepository) : super(SettingState.initial());

  Future<void> signOut() async {
    if (state.status == SettingStatus.submitting) return;
    emit(state.copyWith(status: SettingStatus.submitting));
    try {
      await _authRepository.logout();
      toastInfo(msg: 'Sign out successfull');
      emit(state.copyWith(status: SettingStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          status: SettingStatus.error,
        ),
      );
    }
  }
}
