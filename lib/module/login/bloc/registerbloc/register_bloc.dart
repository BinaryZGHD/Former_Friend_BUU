
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:f2fbuu/module/login/model/response/re_send_otp_confirm_register_response.dart';
import 'package:f2fbuu/module/login/model/response/screen_register_response.dart';
import 'package:f2fbuu/module/login/model/response/submit_confirm_register_response.dart';
import 'package:f2fbuu/module/login/model/response/submit_register_response.dart';
import 'package:f2fbuu/module/login/repository/register_repository.dart';
import 'package:flutter/material.dart';


part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> with RegisterRepository {
  RegisterBloc() : super(RegisterInitial()) {
    // on<RegisterEvent>((event, emit) {
    //   // TODO: implement event handler
    // });

    on<ScreenInfoRegisterEvent>((event, emit) async {

      try {
        emit(RegisterLoading());
        Response response = await getScreenRegister();
        emit(RegisterEndLoading());
        if (response.statusCode == 200) {
          ScreenRegisterResponse screenRegisterResponse =
          ScreenRegisterResponse.fromJson(response.data);
          if (screenRegisterResponse.head?.status == 200) {
            emit(ScreenInfoRegisterSuccessState(responseRegisterScreen: screenRegisterResponse));
          } else {
            emit(RegisterError(message: screenRegisterResponse.head?.message ?? ""));
          }
        } else {
          emit(RegisterError(message: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(RegisterError(message: e.response?.statusMessage ?? ""));
      }

    });
    on<SubmitRegisterEvent>((event, emit) async {
      try {
        emit(RegisterLoading());
        Response responseSubmitRegister = await getSubmitRegister(
            event.userID,
            event.phone,
            event.emailRegister,
            event.name,
            event.lastName,
            event.password,
            event.confirmPassword);
        emit(RegisterEndLoading());
        if (responseSubmitRegister.statusCode == 200) {
          SubmitRegisterResponse submitRegisterResponse =
          SubmitRegisterResponse.fromJson(responseSubmitRegister.data);
          if (submitRegisterResponse.head?.status == 200) {
            emit(SubmitRegisterState(responseRegisterSubmit: submitRegisterResponse,email: event.emailRegister,userID: event.userID));
          } else {
            emit(RegisterError(message: submitRegisterResponse.head?.message ?? ""));
          }
        } else {
          emit(RegisterError(message: responseSubmitRegister.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(RegisterError(message: e.response?.statusMessage ?? ""));
      }

    });

    on<ScreenInfoConfirmRegisterEvent>((event, emit) async {

      try {
        emit(ConfirmRegisterLoading());
        Response responseConfirmRegisterScreenInfo = await getScreenRegister();
        emit(ConfirmRegisterEndLoading());
        if (responseConfirmRegisterScreenInfo.statusCode == 200) {
          ScreenRegisterResponse screenConfirmRegisterResponse =
          ScreenRegisterResponse.fromJson(responseConfirmRegisterScreenInfo.data);
          if (screenConfirmRegisterResponse.head?.status == 200) {
            emit(ScreenInfoConfirmRegisterSuccessState(responseConfirmRegisterScreen: screenConfirmRegisterResponse));
          } else {
            emit(ConfirmRegisterError(message: screenConfirmRegisterResponse.head?.message ?? ""));
          }
        } else {
          emit(ConfirmRegisterError(message: responseConfirmRegisterScreenInfo.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ConfirmRegisterError(message: e.response?.statusMessage ?? ""));
      }

    });



    on<SubmitConfirmRegisterEvent>((event, emit) async {
      try {
        emit(ConfirmRegisterLoading());
        Response responseSubmitConfirmRegister = await geSubmitConfirmRegister(
            event.userID,
            event.email,
            event.otp,);
        emit(ConfirmRegisterEndLoading());
        if (responseSubmitConfirmRegister.statusCode == 200) {
          SubmitConfirmRegisterResponse submitConfirmRegisterResponse =
          SubmitConfirmRegisterResponse.fromJson(responseSubmitConfirmRegister.data);
          if (submitConfirmRegisterResponse.head?.status == 200) {
            emit(SubmitConfirmRegisterState(responseSubmitConfirmRegister: submitConfirmRegisterResponse,));
          } else {
            emit(RegisterError(message: submitConfirmRegisterResponse.head?.message ?? ""));
          }
        } else {
          emit(RegisterError(message: responseSubmitConfirmRegister.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(RegisterError(message: e.response?.statusMessage ?? ""));
      }

    });





    on<ReSentOTPConfirmRegisterEvent>((event, emit) async {
      try {
        // emit(ConfirmRegisterLoading());
        Response responsereSendOtpConfirmRegister = await getReSendOTPConfirmRegister(
            event.userID,
            event.email,);
        // emit(ConfirmRegisterEndLoading());
        if (responsereSendOtpConfirmRegister.statusCode == 200) {
          ReSendOtpConfirmRegisterResponse reSendOtpConfirmRegisterResponse =
          ReSendOtpConfirmRegisterResponse.fromJson(responsereSendOtpConfirmRegister.data);
          if (reSendOtpConfirmRegisterResponse.head?.status == 200) {
            emit(ReSentOTPConfirmRegisterState(responseReSentOTPConfirmRegistern: reSendOtpConfirmRegisterResponse,));
          } else {
            emit(ConfirmRegisterError(message: reSendOtpConfirmRegisterResponse.head?.message ?? ""));
          }
        } else {
          emit(ConfirmRegisterError(message: responsereSendOtpConfirmRegister.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ConfirmRegisterError(message: e.response?.statusMessage ?? ""));
      }

    });
  }
}
