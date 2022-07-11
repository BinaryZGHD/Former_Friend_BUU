part of 'forgorpassword_bloc.dart';

@immutable
abstract class ForgorpasswordEvent {}
class ForgotPasswordScreenInfoEvent extends ForgorpasswordEvent{
  String userLanguage;
  ForgotPasswordScreenInfoEvent({required this.userLanguage });
}class SetNewForgotPasswordScreenInfoEvent extends ForgorpasswordEvent{
  String userLanguage;
  SetNewForgotPasswordScreenInfoEvent({required this.userLanguage });
}
class ForgotPasswordSubmitEvent extends ForgorpasswordEvent{
  String userLanguage;
  String email;
  String userID;
  ForgotPasswordSubmitEvent({required this.userLanguage,required this.email,required this.userID});
}


class  SetNewForgotPasswordSentOTPEvent extends ForgorpasswordEvent{
  String userLanguage;
  String email;
  String userID;
  SetNewForgotPasswordSentOTPEvent({required this.userLanguage,required this.email,required this.userID});
}
class SetNewForgotPasswordSubmitEvent extends ForgorpasswordEvent{
  String userLanguage;
  String password;
  String confirmpassword;
  String otp;
  SetNewForgotPasswordSubmitEvent({required this.userLanguage,required this.password,required this.confirmpassword,required this.otp});
}