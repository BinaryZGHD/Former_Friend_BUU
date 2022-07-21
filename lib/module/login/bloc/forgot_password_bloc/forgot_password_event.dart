part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent {}
class ScreenInfoForgotPasswordEvent extends ForgotPasswordEvent{
}class ScreenInfoSetNewForgotPasswordEvent extends ForgotPasswordEvent{
}
class SubmitForgotPasswordEvent extends ForgotPasswordEvent{
  String email;
  String userID;
  SubmitForgotPasswordEvent({required this.email,required this.userID});
}


class  SentOTPSetNewForgotPasswordEvent extends ForgotPasswordEvent{
  String email;
  String userID;
  SentOTPSetNewForgotPasswordEvent({required this.email,required this.userID});
}
class SubmitSetNewForgotPasswordEvent extends ForgotPasswordEvent{
  String password;
  String confirmpassword;
  String otp;
  SubmitSetNewForgotPasswordEvent({required this.password,required this.confirmpassword,required this.otp});
}
class  ReSentOTPSetNewForgotPasswordEvent extends ForgotPasswordEvent{
  String email;
  String userID;
  ReSentOTPSetNewForgotPasswordEvent({required this.email,required this.userID});
}
