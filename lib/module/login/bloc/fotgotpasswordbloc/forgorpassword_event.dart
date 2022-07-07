part of 'forgorpassword_bloc.dart';

@immutable
abstract class ForgorpasswordEvent {}
class ForgotPasswordScreenInfoEvent extends ForgorpasswordEvent{
  String userLanguage;
  ForgotPasswordScreenInfoEvent({required this.userLanguage});
}
