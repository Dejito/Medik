import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(ApplicationInitial()) {
    on<ApplicationEvent>(_updateApplicationIndex);
  }
  void _updateApplicationIndex(ApplicationEvent event, Emitter<ApplicationState> emit){
    emit(ApplicationState(event.index));
  }
}
