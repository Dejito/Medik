part of 'register_bloc.dart';


abstract class RegisterEvent {}

class UsernameEvent extends RegisterEvent{}

class EmailEvent extends RegisterEvent{}

class PasswordEvent extends RegisterEvent{}

class RePasswordEvent extends RegisterEvent{}
