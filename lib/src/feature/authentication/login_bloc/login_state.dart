part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

class LoginInitial extends LoginState {}

class LoadingLoginState extends LoginState{}

class SuccessLoginState extends LoginState{
  final String uid;

  SuccessLoginState(this.uid);
}

class FailedLoginState extends LoginState{
  final String error;

  FailedLoginState(this.error);
}

