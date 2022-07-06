import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:f2fbuu/module/login/model/response/screen_login_response.dart';
import 'package:f2fbuu/module/login/repository/login_repository.dart';

import 'package:flutter/cupertino.dart';



part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> with LoginRepository {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSummitEvent>((event, emit) {
      if (event.users == "q" //&& event.password == "q"
          ) {
        emit(LoginStatusState(statuscheck: true));
      } else {
        emit(LoginStatusState(
          statuscheck: false,
        ));
      }
    });
    on<LoginRegisterEvent>((event, emit) {
      if (event.regstatus == true) {
        emit(LoginRegisterState(regstatus: true));
      } else {
        emit(LoginRegisterState(regstatus: false));
      }
    });
    on<LoginForgotEvent>((event, emit) {
      if (event.regstatus == "F1") {
        emit(LoginForgotState(regstatus: "F1"));
      } else if (event.regstatus == "F2") {
        emit(LoginForgotState(regstatus: "F2"));
      } else {
        emit(LoginForgotState(regstatus: "F3"));
      }
    });

    on<LoginScreenInfoEvent>((event, emit) async {
     
      try {
        emit(LoginLoading());
        Response response = await getScreenLogin(event.userLanguage);
        emit(LoginEndLoading());
        print("statusCode");
        print(response.statusCode);
        if (response.statusCode == 200) {
          ScreenLoginResponse screenLoginResponse =
              ScreenLoginResponse.fromJson(response.data);

        if (screenLoginResponse.head?.status == 200) {
            emit(LoginScreenInfoSuccessState(response: screenLoginResponse));
          } else {
            emit(LoginError(message: screenLoginResponse.head?.message ?? ""));
          }
        } else {
          emit(LoginError(message: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(LoginError(message: e.response?.statusMessage ?? ""));
      }
   
    });
    on<OnClickLanguageEvent>((event, emit) async {

      try {
        emit(LoginLoading());
        Response response = await getScreenLogin(event.userLanguage);
        emit(LoginEndLoading());
        if (response.statusCode == 200) {
          ScreenLoginResponse screenLoginResponse =
              ScreenLoginResponse.fromJson(response.data);

        if (screenLoginResponse.head?.status == 200) {
            emit(OnClickLanguageLoginScreenInfoSuccessState(response: screenLoginResponse));
          } else {
            emit(LoginError(message: screenLoginResponse.head?.message ?? ""));
          }
        } else {
          emit(LoginError(message: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(LoginError(message: e.response?.statusMessage ?? ""));
      }

    });
  }
}
