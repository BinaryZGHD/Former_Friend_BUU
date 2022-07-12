part of 'login_bloc.dart';

abstract class LoginState {
 const LoginState();
}


class LoginScreenInfoSuccessState extends LoginState{
  ScreenLoginResponse  response;

  LoginScreenInfoSuccessState({required this.response});

}
class OnClickLanguageLoginScreenInfoSuccessState extends LoginState{
  ScreenLoginResponse  responseLoginscreen;

  OnClickLanguageLoginScreenInfoSuccessState({required this.responseLoginscreen});

}
class LoginSubmitState extends LoginState {
  SunmitLoginResponse responseLoginscreen;

  LoginSubmitState({ required this.responseLoginscreen});

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

class LoginRegisterState extends LoginState {
  bool regstatus  ;
  LoginRegisterState({required this.regstatus});

}
class LoginForgotState extends LoginState {
   final String regstatus  ;

  LoginForgotState({required this.regstatus});

}
