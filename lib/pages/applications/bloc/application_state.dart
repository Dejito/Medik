part of 'application_bloc.dart';

class ApplicationState {

  final int index;

  ApplicationState(this.index);

}

final class ApplicationInitial extends ApplicationState {
  ApplicationInitial(): super(0);
}
