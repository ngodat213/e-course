import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_flutter/models/custom_error.dart';
import 'package:quiz_flutter/repo/auth_repository.dart';
import 'package:quiz_flutter/widgets/custom_toast.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository _authRepository;

  SignUpCubit(this._authRepository) : super(SignUpState.initial());

  Future<void> signupFormSubmitted(String username, String phoneNumber,
      String email, String password) async {
    if (state.status == SignUpStatus.submitting) return;
    emit(state.copyWith(status: SignUpStatus.submitting));
    try {
      await _authRepository.signUp(
        displayName: username,
        phoneNumber: phoneNumber,
        email: email,
        password: password,
      );
      toastInfo(msg: 'Create account successfull');
      emit(state.copyWith(status: SignUpStatus.success));
    } on CustomError catch (e) {
      emit(
        state.copyWith(errorMsg: e.msg, status: SignUpStatus.error),
      );
      print(e.toString());
    } catch (e) {
      emit(
        state.copyWith(status: SignUpStatus.error),
      );
      print(e.toString());
    }
  }
}
