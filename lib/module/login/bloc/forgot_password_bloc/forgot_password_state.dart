part of 'forgot_password_bloc.dart';

@immutable
abstract class ForgorPasswordState {}

class ForgorpasswordInitial extends ForgorPasswordState {}

class ForgotPasswordLoading extends ForgorPasswordState{}
class ForgotPasswordEndLoading extends ForgorPasswordState{}
class ScreenInfoForgotPasswordSuccessState extends ForgorPasswordState{
  ScreenForgotPasswordResponse  responseForgotPassword;
 ScreenInfoForgotPasswordSuccessState({required this.responseForgotPassword});}
class SubmitForgotPasswordSuccessState extends ForgorPasswordState{
  SubmitForgotPasswordResponse  responseSubmitForgotPassword;
  String emailForgotPassword;
  String userIDForgotPassword;
  SubmitForgotPasswordSuccessState({required this.responseSubmitForgotPassword, required this.emailForgotPassword, required this.userIDForgotPassword});}
class ForgotPasswordError extends ForgorPasswordState{
  String message;
  ForgotPasswordError({required this.message});}


class SetNewForgotPasswordLoading extends ForgorPasswordState{}
class SetNewForgotPasswordEndLoading extends ForgorPasswordState{}
class ScreenInfoSetNewForgotPasswordSuccessState extends ForgorPasswordState{
  ScreenForgotPasswordResponse  responseSetNewForgotPassword;
  ScreenInfoSetNewForgotPasswordSuccessState({required this.responseSetNewForgotPassword});}
class SubmitSetNewForgotPasswordSuccessState extends ForgorPasswordState{
  SubmitForgotSetNewForgotPasswordResponse  responseSetNewSubmitForgotPassword;

  SubmitSetNewForgotPasswordSuccessState({required this.responseSetNewSubmitForgotPassword});}
class SetNewForgotPasswordError extends ForgorPasswordState{
  String message;
  SetNewForgotPasswordError({required this.message});}

class ReSentOTPSetNewForgotPasswordError extends ForgorPasswordState{
  String message;
  ReSentOTPSetNewForgotPasswordError({required this.message});}

class ReSentOTPSetNewForgotPasswordSuccessState extends ForgorPasswordState{
  ReSendOtpForgotPasswordResponse  responseReSendOtpForgotPasswordResponse;
  String emailForgotPassword;
  String userIDForgotPassword;
  ReSentOTPSetNewForgotPasswordSuccessState({required this.responseReSendOtpForgotPasswordResponse, required this.emailForgotPassword, required this.userIDForgotPassword});}


