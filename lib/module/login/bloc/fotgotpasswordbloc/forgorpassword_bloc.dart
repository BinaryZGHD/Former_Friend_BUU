import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:f2fbuu/module/login/model/response/screen_forgot_password_response.dart';
import 'package:f2fbuu/module/login/model/response/submit_forgot_password_response.dart';
import 'package:f2fbuu/module/login/model/response/submit_forgot_setnew_forgotpassword_response.dart';
import 'package:f2fbuu/module/login/repository/forgotpassword_repository.dart';
import 'package:meta/meta.dart';


part 'forgorpassword_event.dart';
part 'forgorpassword_state.dart';

class ForgorPasswordBloc extends Bloc<ForgorpasswordEvent, ForgorPasswordState>  with ForgotPasswordRepository{
  ForgorPasswordBloc() : super(ForgorpasswordInitial()) {
    on<ForgorpasswordEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ForgotPasswordScreenInfoEvent>((event, emit) async {

      try {
        emit(ForgotPasswordLoading());
        Response response = await getScreenForgotPassword(event.userLanguage);
        emit(ForgotPasswordEndLoading());

        if (response.statusCode == 200) {
          ScreenForgotPasswordResponse screenForgotPasswordResponse =
          ScreenForgotPasswordResponse.fromJson(response.data);
          if (screenForgotPasswordResponse.head?.status == 200) {
            emit(ForgotPasswordScreenInfoSuccessState(responseForgotPassword: screenForgotPasswordResponse));
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

    on<SetNewForgotPasswordScreenInfoEvent>((event, emit) async {

      try {
        emit(SetNewForgotPasswordLoading());
        Response response = await getScreenForgotPassword(event.userLanguage);
        emit(SetNewForgotPasswordEndLoading());

        if (response.statusCode == 200) {
          ScreenForgotPasswordResponse screenSetNewForgotPasswordResponse =
          ScreenForgotPasswordResponse.fromJson(response.data);
          if (screenSetNewForgotPasswordResponse.head?.status == 200) {
            emit(SetNewForgotPasswordScreenInfoSuccessState(responseSetNewForgotPassword: screenSetNewForgotPasswordResponse));
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

    on<ForgotPasswordSubmitEvent>((event, emit) async {

      try {
        emit(ForgotPasswordLoading());
        Response response = await getSubmitForgotPassword(event.email, event.userID);
        emit(ForgotPasswordEndLoading());

        if (response.statusCode == 200) {
          SubmitForgotPasswordResponse submitForgotPasswordResponse =
          SubmitForgotPasswordResponse.fromJson(response.data);
          if (submitForgotPasswordResponse.head?.status == 200) {
            emit(ForgotPasswordSubmitSuccessState(responseSubmitForgotPassword: submitForgotPasswordResponse));
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
    on<SetNewForgotPasswordSubmitEvent>((event, emit) async {

      try {
        emit(SetNewForgotPasswordLoading());
        Response response = await getSubmitSetNewForgotPassword(event.password, event.confirmpassword, event.otp);
        emit(SetNewForgotPasswordEndLoading());

        if (response.statusCode == 200) {
          SubmitForgotSetNewForgotPasswordResponse submitForgotSetNewForgotPasswordResponse =
          SubmitForgotSetNewForgotPasswordResponse.fromJson(response.data);
          if (submitForgotSetNewForgotPasswordResponse.head?.status == 200) {
            emit(SetNewForgotPasswordSubmitSuccessState(responseSetNewSubmitForgotPassword: submitForgotSetNewForgotPasswordResponse));
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
  }
}
