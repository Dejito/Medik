part of 'application_bloc.dart';

class ApplicationState {

  final int index;

  ApplicationState(this.index);

}

class ApplicationInitial extends ApplicationState {
  ApplicationInitial(): super(0);
}
