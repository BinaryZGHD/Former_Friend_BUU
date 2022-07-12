part of 'forgorpassword_bloc.dart';

@immutable
abstract class ForgorpasswordEvent {}
class ScreenInfoForgotPasswordEvent extends ForgorpasswordEvent{
  String userLanguage;
  ScreenInfoForgotPasswordEvent({required this.userLanguage });
}class ScreenInfoSetNewForgotPasswordEvent extends ForgorpasswordEvent{
  String userLanguage;
  ScreenInfoSetNewForgotPasswordEvent({required this.userLanguage });
}
class SubmitForgotPasswordEvent extends ForgorpasswordEvent{
  String userLanguage;
  String email;
  String userID;
  SubmitForgotPasswordEvent({required this.userLanguage,required this.email,required this.userID});
}


class  SentOTPSetNewForgotPasswordEvent extends ForgorpasswordEvent{
  String userLanguage;
  String email;
  String userID;
  SentOTPSetNewForgotPasswordEvent({required this.userLanguage,required this.email,required this.userID});
}
class SubmitSetNewForgotPasswordEvent extends ForgorpasswordEvent{
  String userLanguage;
  String password;
  String confirmpassword;
  String otp;
  SubmitSetNewForgotPasswordEvent({required this.userLanguage,required this.password,required this.confirmpassword,required this.otp});
}
class  ReSentOTPSetNewForgotPasswordEvent extends ForgorpasswordEvent{
  String userLanguage;
  String email;
  String userID;
  ReSentOTPSetNewForgotPasswordEvent({required this.userLanguage,required this.email,required this.userID});
}