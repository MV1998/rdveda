
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginRequestedEvent>(_loginRequested);
  }

  // @override
  // void onTransition(Transition<LoginEvent, LoginState> transition) {
  //   print(transition.event);
  //   super.onTransition(transition);
  // }
  @override
  void onChange(Change<LoginState> change) {
    super.onChange(change);
    print("onChange $change");
  }

  @override
  void onTransition(Transition<LoginEvent, LoginState> transition) {
    super.onTransition(transition);
    print("onTransition $transition");
  }
  // @override
  // void onError(Object error, StackTrace stackTrace) {
  //   print(stackTrace.toString());
  //   super.onError(error, stackTrace);
  // }
  //
  // @override
  // void onEvent(LoginEvent event) {
  //   print(event);
  //   super.onEvent(event);
  // }

  void _loginRequested(LoginRequestedEvent event, Emitter<LoginState> emit) async {
    emit(LoadingLoginState());
    try {
      final username = event.username;
      final password = event.password;
      if (username.isEmpty) {
        return emit(FailedLoginState("Please enter email"));
      }else if (password.isEmpty) {
        return emit(FailedLoginState("Please enter password"));
      }else if (password.length < 6) {
        return emit(FailedLoginState("Password length should not be less than 6"));
      }
      await Future.delayed(const Duration(seconds: 5));
      emit(SuccessLoginState("${event.username}-${event.username}"));
    }catch(e) {
      emit(FailedLoginState(e.toString()));
    }
  }

}
