import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_flutter/repo/auth_repository.dart';
import 'package:quiz_flutter/widgets/custom_toast.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepository _authRepository;
  SignInCubit(this._authRepository) : super(SignInState.initial());

  void emailChanged(String value) {
    emit(
      state.copyWith(
        email: value,
        status: LoginStatus.initial,
      ),
    );
  }

  void passwordChanged(String value) {
    emit(
      state.copyWith(
        password: value,
        status: LoginStatus.initial,
      ),
    );
  }

  Future<void> logInWithCredentials() async {
    if (state.status == LoginStatus.submitting) return;
    emit(state.copyWith(status: LoginStatus.submitting));
    try {
      await _authRepository.logInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
      toastInfo(msg: 'Login successfull');
      emit(state.copyWith(status: LoginStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          status: LoginStatus.error,
        ),
      );
    }
  }
}
