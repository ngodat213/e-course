import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_flutter/models/models.dart';
import 'package:quiz_flutter/repo/auth_repository.dart';
import 'package:quiz_flutter/repo/user_repository/user_repository.dart';
import 'package:quiz_flutter/widgets/custom_toast.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final UserRepository _userRepository;
  final AuthRepository _authRepository;
  ProfileCubit(this._userRepository, this._authRepository)
      : super(ProfileState.initial());

  void emailChanged(String value) {
    emit(
      state.copyWith(
        newEmail: value,
        status: ProfileStatus.initial,
      ),
    );
  }

  void oldEmailChanged(String value) {
    emit(
      state.copyWith(
        oldEmail: value,
        status: ProfileStatus.initial,
      ),
    );
  }

  void passwordChanged(String value) {
    emit(
      state.copyWith(
        password: value,
        status: ProfileStatus.initial,
      ),
    );
  }

  void userNameChanged(String value) {
    emit(
      state.copyWith(
        userName: value,
        status: ProfileStatus.initial,
      ),
    );
  }

  void phoneNumberChanged(String value) {
    emit(
      state.copyWith(
        phoneNumber: value,
        status: ProfileStatus.initial,
      ),
    );
  }

  void resetPassword(String value) {
    emit(
      state.copyWith(
        email: value,
        status: ProfileStatus.initial,
      ),
    );
  }

  Future<void> updateUserName() async {
    if (state.status == ProfileStatus.submitting) return;
    if (state.userName != "") {
      try {
        await _userRepository.updateUserName(state.userName);
        toastInfo(msg: 'Update user name successfull');
        emit(state.copyWith(status: ProfileStatus.success));
      } on CustomError catch (e) {
        throw CustomError(code: e.code, plugin: e.plugin);
      } catch (e) {
        throw CustomError(
          code: 'Exception QuizCubit',
          msg: e.toString(),
          plugin: 'flutter_error/server_error',
        );
      }
    } else {
      toastInfo(msg: 'Fill user name text field');
      emit(state.copyWith(status: ProfileStatus.error));
    }
  }

  Future<void> updateEmail() async {
    if (state.status == ProfileStatus.submitting) return;
    if (state.newEmail != "" || state.oldEmail == "" || state.password == "") {
      try {
        await _authRepository.logInWithEmailAndPassword(
            email: state.oldEmail, password: state.password);
        await _userRepository.updateEmail(state.newEmail);
        emit(state.copyWith(status: ProfileStatus.success));
      } on CustomError catch (e) {
        throw CustomError(code: e.code, plugin: e.plugin);
      } catch (e) {
        throw CustomError(
          code: 'Exception QuizCubit',
          msg: e.toString(),
          plugin: 'flutter_error/server_error',
        );
      }
    } else {
      toastInfo(msg: 'Fill email text field');
      emit(state.copyWith(status: ProfileStatus.error));
    }
  }

  Future<void> updatePhoneNumber() async {
    if (state.status == ProfileStatus.submitting) return;
    if (state.phoneNumber != "") {
      try {
        await _userRepository.updatePhoneNumberCollection(state.phoneNumber);
        toastInfo(msg: 'Update phone number successfull');
        emit(state.copyWith(status: ProfileStatus.success));
      } on CustomError catch (e) {
        throw CustomError(code: e.code, plugin: e.plugin);
      } catch (e) {
        throw CustomError(
          code: 'Exception QuizCubit',
          msg: e.toString(),
          plugin: 'flutter_error/server_error',
        );
      }
    } else {
      toastInfo(msg: 'Fill phone number text field');
      emit(state.copyWith(status: ProfileStatus.error));
    }
  }
}
