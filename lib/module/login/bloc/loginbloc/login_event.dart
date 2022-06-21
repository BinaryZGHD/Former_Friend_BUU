part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}


class LoginScreenInfoEvent extends LoginEvent{

}


class LoginSummitEvent extends LoginEvent {
  String users ;
  String password ;
  LoginSummitEvent({required this.users,required this.password});
}
class LoginRegisterEvent extends LoginEvent {
  bool regstatus ;
  LoginRegisterEvent({required this.regstatus});
}
class LoginForgotEvent extends LoginEvent {
  String regstatus ;
  LoginForgotEvent({required this.regstatus});
}


