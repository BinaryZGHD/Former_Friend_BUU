part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}
class ScreenInfoRegisterEvent extends RegisterEvent{
  String userLanguage;
  ScreenInfoRegisterEvent({
    required this.userLanguage
  });
}class ScreenInfoConfirmRegisterEvent extends RegisterEvent{
  String userLanguage;
  ScreenInfoConfirmRegisterEvent({
    required this.userLanguage
  });
}
class SubmitRegisterEvent extends RegisterEvent{
  String userLanguage;
  String userID;
  String emailRegister;
  String phone;
  String name;
  String lastName;
  String password;
  String confirmPassword;


  SubmitRegisterEvent({
    required this.userLanguage,
    required this.userID,
    required this.emailRegister,
    required this.phone,
    required this.name,
    required this.lastName,
    required this.password,
    required this.confirmPassword,
  });
}
class ReSentOTPConfirmRegisterEvent extends RegisterEvent{
  String userLanguage;
  String email;
  String userID;


  ReSentOTPConfirmRegisterEvent({
    required this.userLanguage,required this.email,required this.userID,
  });
}
class SubmitConfirmRegisterEvent extends RegisterEvent{
  String userLanguage;
  String email;
  String userID;
  String otp;


  SubmitConfirmRegisterEvent({
    required this.userLanguage,required this.email,required this.userID,required this.otp,
  });
}