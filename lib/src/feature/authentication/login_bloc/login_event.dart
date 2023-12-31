part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginRequestedEvent extends LoginEvent{
  final String username;
  final String password;
  LoginRequestedEvent(this.username, this.password);
}


