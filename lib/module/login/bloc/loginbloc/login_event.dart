part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginScreenInfoEvent extends LoginEvent {
  String userLanguage;
  LoginScreenInfoEvent({required this.userLanguage});
}

class OnClickLanguageEvent extends LoginEvent {
  String userLanguage;
  OnClickLanguageEvent({required this.userLanguage});
}

class LoginSummitEvent extends LoginEvent {
  String users;
  String password;
  LoginSummitEvent({required this.users, required this.password});
}

class LoginRegisterEvent extends LoginEvent {
  bool regstatus;
  LoginRegisterEvent({required this.regstatus});
}

class LoginForgotEvent extends LoginEvent {
  String regstatus;
  LoginForgotEvent({required this.regstatus});
}
