part of 'forgot_password_bloc.dart';

@immutable
abstract class ForgorpasswordEvent {}
class ScreenInfoForgotPasswordEvent extends ForgorpasswordEvent{
}class ScreenInfoSetNewForgotPasswordEvent extends ForgorpasswordEvent{
}
class SubmitForgotPasswordEvent extends ForgorpasswordEvent{
  String email;
  String userID;
  SubmitForgotPasswordEvent({required this.email,required this.userID});
}


class  SentOTPSetNewForgotPasswordEvent extends ForgorpasswordEvent{
  String email;
  String userID;
  SentOTPSetNewForgotPasswordEvent({required this.email,required this.userID});
}
class SubmitSetNewForgotPasswordEvent extends ForgorpasswordEvent{
  String password;
  String confirmpassword;
  String otp;
  SubmitSetNewForgotPasswordEvent({required this.password,required this.confirmpassword,required this.otp});
}
class  ReSentOTPSetNewForgotPasswordEvent extends ForgorpasswordEvent{
  String email;
  String userID;
  ReSentOTPSetNewForgotPasswordEvent({required this.email,required this.userID});
}