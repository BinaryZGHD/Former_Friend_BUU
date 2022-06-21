part of 'login_bloc.dart';

abstract class LoginState {
 const LoginState();
}


class LoginScreenInfoSuccessState extends LoginState{
  ScreenLoginResponse  response;
  LoginScreenInfoSuccessState({required this.response});
}

class LoginLoading extends LoginState{

}

class LoginEndLoading extends LoginState{
  
}

class LoginError extends LoginState{
  String message;
  LoginError({required this.message});
}


class LoginInitial extends LoginState {
  @override
  String toString() => 'LoginInitial';
}
class LoginStatusState extends LoginState {
  bool statuscheck  ;
  LoginStatusState({required this.statuscheck});

}
class LoginRegisterState extends LoginState {
  bool regstatus  ;
  LoginRegisterState({required this.regstatus});

}
class LoginForgotState extends LoginState {
   final String regstatus  ;

  LoginForgotState({required this.regstatus});

}
