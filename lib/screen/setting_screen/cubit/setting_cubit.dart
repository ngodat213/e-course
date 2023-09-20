import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quiz_flutter/models/models.dart';
import 'package:quiz_flutter/repo/auth_repository.dart';
import 'package:quiz_flutter/repo/user_repository/user_repository.dart';
import 'package:quiz_flutter/widgets/custom_toast.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  SettingCubit(
    this._authRepository,
    this._userRepository,
  ) : super(SettingState.initial());

  void getUser() async {
    emit(state.copyWith(status: SettingStatus.submitting));
    try {
      final User user = await _userRepository.getProfile();
      emit(state.copyWith(user: user, status: SettingStatus.success));
    } on FirebaseException catch (e) {
      throw CustomError(code: e.code, msg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

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
