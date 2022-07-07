import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:f2fbuu/module/login/model/response/screen_forgotpassword_response.dart';
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
            emit(ForgotPasswordScreenInfoSuccessState(response: screenForgotPasswordResponse));
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
  }
}
