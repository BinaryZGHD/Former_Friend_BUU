part of 'login_bloc.dart';

abstract class LoginState {
 const LoginState();
}


class ScreenInfoLoginSuccessState extends LoginState{
  ScreenLoginResponse  responseScreenInfoLogin;

  ScreenInfoLoginSuccessState({required this.responseScreenInfoLogin});

}
class OnClickLanguageLoginScreenInfoSuccessState extends LoginState{
  ScreenLoginResponse  responseLanguageLoginscreen;

  OnClickLanguageLoginScreenInfoSuccessState({required this.responseLanguageLoginscreen});

}
class SubmitLoginState extends LoginState {
  SunmitLoginResponse responseSunmitLoginscreen;

  SubmitLoginState({ required this.responseSunmitLoginscreen});

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
