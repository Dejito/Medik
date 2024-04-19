part of 'homepage_bloc.dart';

class HomepageState {
  int index;

  HomepageState({this.index = 0});

  HomepageState copyWith(int index){
    return HomepageState(index: index);
  }

}

class HomepageInitial extends HomepageState {
  HomepageInitial({super.index});
}
