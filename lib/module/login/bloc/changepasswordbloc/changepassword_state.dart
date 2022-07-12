part of 'changepassword_bloc.dart';

@immutable
abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}


class ScreenInfoChangePasswordSuccessState extends ChangePasswordState{
  ScreenChangePasswordResponse  responseChangePasswordScreenInfo;

  ScreenInfoChangePasswordSuccessState({required this.responseChangePasswordScreenInfo});

}
class ChangePasswordLoading extends ChangePasswordState{

}

class ChangePasswordEndLoading extends ChangePasswordState{

}

class ChangePasswordError extends ChangePasswordState{
  String message;
  ChangePasswordError({required this.message});
}