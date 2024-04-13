part of 'register_bloc.dart';


abstract class RegisterEvent {}

class UsernameEvent extends RegisterEvent{
  final String username;

  UsernameEvent(this.username);
}

class OnboardingEmailEvent extends RegisterEvent{
  final String email;
  OnboardingEmailEvent(this.email);

}

class OnboardingPasswordEvent extends RegisterEvent{
  final String password;

  OnboardingPasswordEvent(this.password);

}

class RePasswordEvent extends RegisterEvent{
  final String rePassword;

  RePasswordEvent(this.rePassword);

}
