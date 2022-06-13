part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

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
