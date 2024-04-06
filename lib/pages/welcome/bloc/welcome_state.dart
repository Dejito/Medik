part of 'welcome_bloc.dart';

class WelcomeState {
  int position;

  WelcomeState({required this.position});
}

final class WelcomeInitial extends WelcomeState {
  WelcomeInitial(): super(position: 0);
}
