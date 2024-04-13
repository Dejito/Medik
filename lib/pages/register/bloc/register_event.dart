part of 'register_bloc.dart';


abstract class RegisterEvent {}

class UsernameEvent extends RegisterEvent{
  final String username;

  UsernameEvent(this.username);
}

class EmailEvent extends RegisterEvent{
  final String email;
  EmailEvent(this.email);

}

class PasswordEvent extends RegisterEvent{
  final String password;

  PasswordEvent(this.password);

}

class RePasswordEvent extends RegisterEvent{
  final String rePassword;

  RePasswordEvent(this.rePassword);

}
