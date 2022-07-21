part of 'register_bloc.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}


class ScreenInfoRegisterSuccessState extends RegisterState{
  ScreenRegisterResponse  responseRegisterScreen;

  ScreenInfoRegisterSuccessState({required this.responseRegisterScreen});

}
class RegisterLoading extends RegisterState{

}

class RegisterEndLoading extends RegisterState{

}

class RegisterError extends RegisterState{
  String message;
  RegisterError({required this.message});
}

class SubmitRegisterState extends RegisterState{
  SubmitRegisterResponse  responseRegisterSubmit;
  String email;
  String userID;
  SubmitRegisterState({required this.responseRegisterSubmit, required this.email, required this.userID});

}
class ScreenInfoConfirmRegisterSuccessState extends RegisterState{
  ScreenRegisterResponse  responseConfirmRegisterScreen;

  ScreenInfoConfirmRegisterSuccessState({required this.responseConfirmRegisterScreen});

}
class ConfirmRegisterLoading extends RegisterState{

}

class ConfirmRegisterEndLoading extends RegisterState{

}

class ConfirmRegisterError extends RegisterState{
  String message;
  ConfirmRegisterError({required this.message});
}
class ReSentOTPConfirmRegisterState extends RegisterState{
  ReSendOtpConfirmRegisterResponse  responseReSentOTPConfirmRegistern;

  ReSentOTPConfirmRegisterState({required this.responseReSentOTPConfirmRegistern});

}
class SubmitConfirmRegisterState extends RegisterState{
  SubmitConfirmRegisterResponse  responseSubmitConfirmRegister;

  SubmitConfirmRegisterState({required this.responseSubmitConfirmRegister,});

}