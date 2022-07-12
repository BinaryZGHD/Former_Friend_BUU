part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}
class RegisterScreenInfoEvent extends RegisterEvent{
  String userLanguage;
  RegisterScreenInfoEvent({required this.userLanguage});
}