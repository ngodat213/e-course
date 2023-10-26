import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/repo/app_repository.dart/app_repository.dart';
import 'package:quiz_flutter/widgets/custom_toast.dart';

part 'commo_info_state.dart';

class CommoInfoCubit extends Cubit<CommoInfoState> {
  final AppRepository _appRepository;
  CommoInfoCubit(this._appRepository) : super(CommoInfoState.initial());

  void fullNameChanged(String fullName) {
    emit(
      state.copyWith(
        fullName: fullName,
        status: CommoInfoStatus.initial,
      ),
    );
  }

  void emailChanged(String value) {
    emit(
      state.copyWith(
        email: value,
        status: CommoInfoStatus.initial,
      ),
    );
  }

  void topicChanged(String value) {
    emit(
      state.copyWith(
        topic: value,
        status: CommoInfoStatus.initial,
      ),
    );
  }

  void textChanged(String value) {
    emit(
      state.copyWith(
        text: value,
        status: CommoInfoStatus.initial,
      ),
    );
  }

  void indexChanged(int value) {
    emit(
      state.copyWith(
        initialIndex: value,
        status: CommoInfoStatus.initial,
      ),
    );
  }

  Future<void> updateContact(BuildContext context) async {
    if (state.status == CommoInfoStatus.submitting) return;
    emit(state.copyWith(status: CommoInfoStatus.submitting));
    if (state.email == "" ||
        state.fullName == "" ||
        state.topic == "" ||
        state.text == "") {
      toastInfo(msg: S.of(context).fillAll);
    } else {
      try {
        await _appRepository.setContactUs(
            state.fullName, state.email, state.topic, state.text);
        toastInfo(msg: 'Contact us successfull!');
        emit(state.copyWith(status: CommoInfoStatus.success));
      } catch (e) {
        emit(
          state.copyWith(
            status: CommoInfoStatus.error,
          ),
        );
      }
    }
  }
}
