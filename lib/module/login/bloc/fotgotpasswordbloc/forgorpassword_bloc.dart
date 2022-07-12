import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:f2fbuu/module/login/model/response/screen_forgot_password_response.dart';
import 'package:f2fbuu/module/login/model/response/submit_forgot_password_response.dart';
import 'package:f2fbuu/module/login/model/response/submit_forgot_setnew_forgotpassword_response.dart';
import 'package:f2fbuu/module/login/repository/forgotpassword_repository.dart';
import 'package:meta/meta.dart';

import '../../model/response/re_send_otp_forgot_password_response.dart';


part 'forgorpassword_event.dart';
part 'forgorpassword_state.dart';

class ForgorPasswordBloc extends Bloc<ForgorpasswordEvent, ForgorPasswordState>  with ForgotPasswordRepository{
  ForgorPasswordBloc() : super(ForgorpasswordInitial()) {
    on<ForgorpasswordEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ScreenInfoForgotPasswordEvent>((event, emit) async {

      try {
        emit(ForgotPasswordLoading());
        Response response = await getScreenForgotPassword(event.userLanguage);
        emit(ForgotPasswordEndLoading());

        if (response.statusCode == 200) {
          ScreenForgotPasswordResponse screenForgotPasswordResponse =
          ScreenForgotPasswordResponse.fromJson(response.data);
          if (screenForgotPasswordResponse.head?.status == 200) {
            emit(ScreenInfoForgotPasswordSuccessState(responseForgotPassword: screenForgotPasswordResponse));
          } else {
            emit(ForgotPasswordError(message: screenForgotPasswordResponse.head?.message ?? ""));
          }
        } else {
          emit(ForgotPasswordError(message: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ForgotPasswordError(message: e.response?.statusMessage ?? ""));
      }

    });

    on<ScreenInfoSetNewForgotPasswordEvent>((event, emit) async {

      try {
        emit(SetNewForgotPasswordLoading());
        Response response = await getScreenForgotPassword(event.userLanguage);
        emit(SetNewForgotPasswordEndLoading());

        if (response.statusCode == 200) {
          ScreenForgotPasswordResponse screenSetNewForgotPasswordResponse =
          ScreenForgotPasswordResponse.fromJson(response.data);
          if (screenSetNewForgotPasswordResponse.head?.status == 200) {
            emit(ScreenInfoSetNewForgotPasswordSuccessState(responseSetNewForgotPassword: screenSetNewForgotPasswordResponse));
          } else {
            emit(SetNewForgotPasswordError(message: screenSetNewForgotPasswordResponse.head?.message ?? ""));
          }
        } else {
          emit(SetNewForgotPasswordError(message: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(SetNewForgotPasswordError(message: e.response?.statusMessage ?? ""));
      }

    });

    on<SubmitForgotPasswordEvent>((event, emit) async {

      try {
        emit(ForgotPasswordLoading());
        Response response = await getSubmitForgotPassword(event.email, event.userID);
        emit(ForgotPasswordEndLoading());

        if (response.statusCode == 200) {
          SubmitForgotPasswordResponse submitForgotPasswordResponse =
          SubmitForgotPasswordResponse.fromJson(response.data);
          if (submitForgotPasswordResponse.head?.status == 200) {
            emit(SubmitForgotPasswordSuccessState(responseSubmitForgotPassword: submitForgotPasswordResponse,userIDForgotPassword: event.userID,emailForgotPassword: event.email));
          } else {
            emit(ForgotPasswordError(message: submitForgotPasswordResponse.head?.message ?? ""));
          }
        } else {
          emit(ForgotPasswordError(message: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ForgotPasswordError(message: e.response?.statusMessage ?? ""));
      }

    });
    on<SubmitSetNewForgotPasswordEvent>((event, emit) async {

      try {
        emit(SetNewForgotPasswordLoading());
        Response response = await getSubmitSetNewForgotPassword(event.password, event.confirmpassword, event.otp);
        emit(SetNewForgotPasswordEndLoading());

        if (response.statusCode == 200) {
          SubmitForgotSetNewForgotPasswordResponse submitForgotSetNewForgotPasswordResponse =
          SubmitForgotSetNewForgotPasswordResponse.fromJson(response.data);
          if (submitForgotSetNewForgotPasswordResponse.head?.status == 200) {
            emit(SubmitSetNewForgotPasswordSuccessState(responseSetNewSubmitForgotPassword: submitForgotSetNewForgotPasswordResponse));
          } else {
            emit(SetNewForgotPasswordError(message: submitForgotSetNewForgotPasswordResponse.head?.message ?? ""));
          }
        } else {
          emit(ForgotPasswordError(message: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ForgotPasswordError(message: e.response?.statusMessage ?? ""));
      }

    });
    on<ReSentOTPSetNewForgotPasswordEvent>((event, emit) async {

      try {
        emit(ReSentOTPSetNewForgotPasswordLoading());
        Response response = await getReSendOTPSetNewForgotPassword(event.email, event.userID);
        emit(ReSentOTPSetNewForgotPasswordEndLoading());

        if (response.statusCode == 200) {
          ReSendOtpForgotPasswordResponse reSendOtpForgotPasswordResponse =
          ReSendOtpForgotPasswordResponse.fromJson(response.data);
          if (reSendOtpForgotPasswordResponse.head?.status == 200) {
            emit(ReSentOTPSetNewForgotPasswordSuccessState(responseReSendOtpForgotPasswordResponse: reSendOtpForgotPasswordResponse,userIDForgotPassword: event.userID,emailForgotPassword: event.email));
          } else {
            emit(ReSentOTPSetNewForgotPasswordError(message: reSendOtpForgotPasswordResponse.head?.message ?? ""));
          }
        } else {
          emit(SetNewForgotPasswordError(message: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(SetNewForgotPasswordError(message: e.response?.statusMessage ?? ""));
      }

    });
  }
}

