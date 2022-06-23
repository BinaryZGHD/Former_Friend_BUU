part of 'forgorpassword_bloc.dart';

@immutable
abstract class ForgorPasswordState {}

class ForgorpasswordInitial extends ForgorPasswordState {}


class ForgotPasswordScreenInfoSuccessState extends ForgorPasswordState{
  ScreenForgotPasswordResponse  response;

  ForgotPasswordScreenInfoSuccessState({required this.response});

}
class ForgotPasswordLoading extends ForgorPasswordState{

}

class ForgotPasswordEndLoading extends ForgorPasswordState{

}

class ForgotPasswordError extends ForgorPasswordState{
  String message;
  ForgotPasswordError({required this.message});
}





