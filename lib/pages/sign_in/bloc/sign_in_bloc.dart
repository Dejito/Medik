import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInEvent>((event, emit) {});

    on<EmailEvent>((event, emit){
      emit(state.copyWith(email: state.email));
    });

    on<PasswordEvent>((event, emit){
      emit(state.copyWith(password: state.password));
    });

    void _emailEvent(EmailEvent event, Emitter emit) {

    }

  }
}
