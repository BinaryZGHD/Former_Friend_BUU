import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:f2fbuu/module/login/model/response/screen_change_password_response.dart';
import 'package:f2fbuu/module/login/repository/changepassword_repository.dart';
import 'package:flutter/cupertino.dart';


part 'changepassword_event.dart';
part 'changepassword_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> with ChangePasswordRepository {
  ChangePasswordBloc() : super(ChangePasswordInitial()) {
    on<ChangePasswordEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ChangePasswordScreenInfoEvent>((event, emit) async {

      try {
        emit(ChangePasswordLoading());
        Response response = await getScreenChangePassword();
        emit(ChangePasswordEndLoading());
        if (response.statusCode == 200) {
          ScreenChangePasswordResponse screenChangePassworddResponse =
          ScreenChangePasswordResponse.fromJson(response.data);
          if (screenChangePassworddResponse.head?.status == "200") {
            emit(ScreenInfoChangePasswordSuccessState(responseChangePasswordScreenInfo: screenChangePassworddResponse));
          } else {
            emit(ChangePasswordError(message: screenChangePassworddResponse.head?.message ?? ""));
          }
        } else {
          emit(ChangePasswordError(message: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ChangePasswordError(message: e.response?.statusMessage ?? ""));
      }

    });
  }
}
