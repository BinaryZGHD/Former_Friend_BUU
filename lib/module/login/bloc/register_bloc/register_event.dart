part of 'register_bloc.dart';

abstract class RegisterEvent {}
class ScreenInfoRegisterEvent extends RegisterEvent{


}class ScreenInfoConfirmRegisterEvent extends RegisterEvent{

}
class SubmitRegisterEvent extends RegisterEvent{
  String userID;
  String emailRegister;
  String phone;
  String name;
  String lastName;
  String password;
  String confirmPassword;


  SubmitRegisterEvent({
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
  String email;
  String userID;


  ReSentOTPConfirmRegisterEvent({required this.email,required this.userID,
  });
}
class SubmitConfirmRegisterEvent extends RegisterEvent{
  String email;
  String userID;
  String otp;


  SubmitConfirmRegisterEvent({required this.email,required this.userID,required this.otp,
  });
}