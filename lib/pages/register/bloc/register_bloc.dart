import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {});

    on<UsernameEvent>((event, emit) {});

  }
  void _usernameEvent(EmailEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(email: event));
}

}
