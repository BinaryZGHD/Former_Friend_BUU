part of 'forgorpassword_bloc.dart';

@immutable
abstract class ForgorPasswordState {}

class ForgorpasswordInitial extends ForgorPasswordState {}

class ForgotPasswordLoading extends ForgorPasswordState{}
class ForgotPasswordEndLoading extends ForgorPasswordState{}
class ForgotPasswordScreenInfoSuccessState extends ForgorPasswordState{
  ScreenForgotPasswordResponse  responseForgotPassword;
 ForgotPasswordScreenInfoSuccessState({required this.responseForgotPassword});}
class ForgotPasswordSubmitSuccessState extends ForgorPasswordState{
  SubmitForgotPasswordResponse  responseSubmitForgotPassword;
  ForgotPasswordSubmitSuccessState({required this.responseSubmitForgotPassword});}
class ForgotPasswordError extends ForgorPasswordState{
  String message;
  ForgotPasswordError({required this.message});}


class SetNewForgotPasswordLoading extends ForgorPasswordState{}
class SetNewForgotPasswordEndLoading extends ForgorPasswordState{}
class SetNewForgotPasswordScreenInfoSuccessState extends ForgorPasswordState{
  ScreenForgotPasswordResponse  responseSetNewForgotPassword;
  SetNewForgotPasswordScreenInfoSuccessState({required this.responseSetNewForgotPassword});}
class SetNewForgotPasswordSubmitSuccessState extends ForgorPasswordState{
  SubmitForgotSetNewForgotPasswordResponse  responseSetNewSubmitForgotPassword;

  SetNewForgotPasswordSubmitSuccessState({required this.responseSetNewSubmitForgotPassword});}
class SetNewForgotPasswordError extends ForgorPasswordState{
  String message;
  SetNewForgotPasswordError({required this.message});}






