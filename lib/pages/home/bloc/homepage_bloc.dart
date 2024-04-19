import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(HomepageInitial()) {
    on<HomepageEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<HomeDotsEvent>(_homeDotEvent);
  }
  void _homeDotEvent(HomeDotsEvent event, Emitter<HomepageState> emit){
    emit(HomepageState(index: event.index));
  }
}
