 part of 'app_bloc.dart';

 class AppState {
   int counter;

   AppState({required this.counter});

}

final class AppInitial extends AppState {
   AppInitial():super(counter: 0);
}
