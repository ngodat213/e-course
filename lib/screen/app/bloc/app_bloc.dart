import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_flutter/models/user.dart';
import 'package:quiz_flutter/repo/auth_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthRepository _authRepository;
  StreamSubscription<User>? _userSubscription;
  AppBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AppState.unauthenticated()) {
    on<AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
  }

  void _onUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    emit(event.user.isNotEmpty
        ? AppState.authenticated(event.user)
        : const AppState.unauthenticated());
  }

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    unawaited(_authRepository.logout());
  }
}
