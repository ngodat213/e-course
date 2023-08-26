import 'package:bloc/bloc.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    on<EmailEvent>(_emailEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<ForgotPasswordState> emit) {
    emit(state.copyWith(email: event.email));
  }
}
