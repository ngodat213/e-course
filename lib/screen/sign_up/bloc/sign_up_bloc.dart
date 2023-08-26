import 'package:bloc/bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<DisplayNameEvent>(_userNameEvent);
    on<PhoneNumberEvent>(_phoneNumberEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<ConfirmPasswordEvent>(_confirmPasswordEvent);
  }

  void _userNameEvent(DisplayNameEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(displayName: event.displayName));
  }

  void _phoneNumberEvent(PhoneNumberEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(phoneNumber: event.phoneNumber));
  }

  void _emailEvent(EmailEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _confirmPasswordEvent(
      ConfirmPasswordEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }
}
