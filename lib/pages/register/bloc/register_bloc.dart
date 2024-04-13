import 'package:bloc/bloc.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {});

    on<UsernameEvent>(_usernameEvent);
    on<OnboardingEmailEvent>(_emailEvent);
    on<OnboardingPasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_rePasswordEvent);
  }

  void _usernameEvent(UsernameEvent event, Emitter<RegisterState> emit) {
    print(event.username);
    emit(state.copyWith(email: event.username));
  }

  void _emailEvent(OnboardingEmailEvent event, Emitter<RegisterState> emit) {
    print(event.email);
    emit(state.copyWith(email: event.email));
  }
  void _passwordEvent(OnboardingPasswordEvent event, Emitter<RegisterState> emit) {
    print(event.password);
    emit(state.copyWith(email: event.password));
  }
  void _rePasswordEvent(RePasswordEvent event, Emitter<RegisterState> emit) {
    print(event.rePassword);
    emit(state.copyWith(email: event.rePassword));
  }
}
