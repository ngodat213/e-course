import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:quiz_flutter/utils/localization_managet.dart';

part 'change_language_state.dart';

class ChangeLanguageCubit extends Cubit<ChangeLanguageState> {
  final _localizationManager = LocalizationManager();
  ChangeLanguageCubit() : super(ChangeLanguageState.initial());

  Future<void> changeLang(int lang) async {
    switch (lang) {
      case 0:
        await _localizationManager.saveLocalization(lang);
        emit(state.copyWith(locale: const Locale('en'), index: lang));
        break;
      case 1:
        await _localizationManager.saveLocalization(lang);
        emit(state.copyWith(locale: const Locale('vi'), index: lang));
        break;
    }
  }

  Future<void> getLang() async {
    final lang = await _localizationManager.getLocalization();
    switch (lang) {
      case 0:
        emit(state.copyWith(locale: const Locale('en'), index: lang));
        break;
      case 1:
        emit(state.copyWith(locale: const Locale('vi'), index: lang));
        break;
    }
  }
}
