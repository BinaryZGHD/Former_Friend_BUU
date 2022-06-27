part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}


class RegisterScreenInfoSuccessState extends RegisterState{
  ScreenRegisterResponse  response;

  RegisterScreenInfoSuccessState({required this.response});

}
class RegisterLoading extends RegisterState{

}

class RegisterEndLoading extends RegisterState{

}

class RegisterError extends RegisterState{
  String message;
  RegisterError({required this.message});
}

