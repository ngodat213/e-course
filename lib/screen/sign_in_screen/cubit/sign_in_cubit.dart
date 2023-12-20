import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_flutter/models/models.dart';
import 'package:quiz_flutter/repo/auth_repository.dart';
import 'package:quiz_flutter/widgets/custom_toast.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepository _authRepository;
  SignInCubit(this._authRepository) : super(SignInState.initial());

  Future<void> logInWithCredentials(String email, String password) async {
    if (state.status == LoginStatus.submitting) return;
    emit(state.copyWith(status: LoginStatus.submitting));
    if (email != "" || password != "") {
      try {
        await _authRepository.logInWithEmailAndPassword(
          email: email,
          password: password,
        );
        toastInfo(msg: 'Login successfull');
        emit(state.copyWith(status: LoginStatus.success));
      } on CustomError {
        emit(state.copyWith(status: LoginStatus.error));
      } catch (e) {
        emit(state.copyWith(status: LoginStatus.error));
      }
    } else {
      toastInfo(msg: "Fill in all text fields");
      emit(state.copyWith(status: LoginStatus.error));
    }
  }
}
