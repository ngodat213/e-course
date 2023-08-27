import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_flutter/repo/auth_repository.dart';
import 'package:quiz_flutter/widgets/custom_toast.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepository _authRepository;
  ForgotPasswordCubit(this._authRepository)
      : super(ForgotPasswordState.initial());

  void emailChanged(String value) {
    emit(
      state.copyWith(
        email: value,
        status: ForgotPasswordStatus.initial,
      ),
    );
  }

  Future<void> forgotPassword() async {
    if (state.status == ForgotPasswordStatus.submitting) return;
    emit(state.copyWith(status: ForgotPasswordStatus.submitting));
    try {
      await _authRepository.forgotPassword(
        email: state.email,
      );
      toastInfo(msg: 'Check your message email');
      emit(state.copyWith(status: ForgotPasswordStatus.success));
    } catch (_) {}
  }
}
