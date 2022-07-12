part of 'forgorpassword_bloc.dart';

@immutable
abstract class ForgorpasswordEvent {}
class ForgotPasswordScreenInfoEvent extends ForgorpasswordEvent{
  String userLanguage;
  ForgotPasswordScreenInfoEvent({required this.userLanguage });
}
class ForgotPasswordSubmitEvent extends ForgorpasswordEvent{
  String userLanguage;
  String email;
  String userID;
  ForgotPasswordSubmitEvent({required this.userLanguage,required this.email,required this.userID});
}
