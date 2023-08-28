import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_flutter/models/custom_error.dart';
import 'package:quiz_flutter/repo/auth_repository.dart';
import 'package:quiz_flutter/widgets/custom_toast.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository _authRepository;

  SignUpCubit(this._authRepository) : super(SignUpState.initial());

  void displayNameChanged(String value) {
    emit(
      state.copyWith(
        displayName: value,
        status: SignUpStatus.initial,
      ),
    );
  }

  void phoneNumberChanged(String value) {
    emit(
      state.copyWith(
        phoneNumber: value,
        status: SignUpStatus.initial,
      ),
    );
  }

  void emailChanged(String value) {
    emit(
      state.copyWith(
        email: value,
        status: SignUpStatus.initial,
      ),
    );
  }

  void passwordChanged(String value) {
    emit(
      state.copyWith(
        password: value,
        status: SignUpStatus.initial,
      ),
    );
  }

  void confirmPasswordChanged(String value) {
    emit(
      state.copyWith(
        confirmPassword: value,
        status: SignUpStatus.initial,
      ),
    );
  }

  Future<void> signupFormSubmitted() async {
    if (state.status == SignUpStatus.submitting) return;
    emit(state.copyWith(status: SignUpStatus.submitting));
    if (state.password == state.confirmPassword) {
      try {
        await _authRepository.signUp(
          displayName: state.displayName,
          phoneNumber: state.phoneNumber,
          email: state.email,
          password: state.password,
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
    } else {
      toastInfo(msg: 'Password and confirm password is not equal');
    }
  }
}
