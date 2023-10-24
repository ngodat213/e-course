part of 'change_language_cubit.dart';

class ChangeLanguageState extends Equatable {
  final Locale locale;
  final int index;
  const ChangeLanguageState({
    required this.locale,
    required this.index,
  });

  factory ChangeLanguageState.initial() {
    return const ChangeLanguageState(locale: Locale('en'), index: 0);
  }

  @override
  List<Object> get props => [locale, index];

  ChangeLanguageState copyWith({
    Locale? locale,
    int? index,
  }) {
    return ChangeLanguageState(
        locale: locale ?? this.locale, index: index ?? this.index);
  }

  @override
  String toString() => 'LocalizationState(locale: $locale,index: $index)';
}
