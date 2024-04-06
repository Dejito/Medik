 part of 'app_bloc.dart';

// @immutable
sealed class AppState {
  final int counter;

  const AppState({required this.counter});

}

final class AppInitial extends AppState {
  const AppInitial():super(counter: 0);
}
