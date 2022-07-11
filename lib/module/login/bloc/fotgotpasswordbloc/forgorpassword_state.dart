part of 'forgorpassword_bloc.dart';

@immutable
abstract class ForgorPasswordState {}

class ForgorpasswordInitial extends ForgorPasswordState {}


class ForgotPasswordScreenInfoSuccessState extends ForgorPasswordState{
  ScreenForgotPasswordResponse  responseForgotPassword;

  ForgotPasswordScreenInfoSuccessState({required this.responseForgotPassword});

}
class ForgotPasswordSubmitSuccessState extends ForgorPasswordState{
  ScreenForgotPasswordResponse  responseSubmitForgotPassword;

  ForgotPasswordSubmitSuccessState({required this.responseSubmitForgotPassword});

}
class ForgotPasswordLoading extends ForgorPasswordState{

}

class ForgotPasswordEndLoading extends ForgorPasswordState{

}

class ForgotPasswordError extends ForgorPasswordState{
  String message;
  ForgotPasswordError({required this.message});
}





