import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../model/response/screen_register.dart';
import '../../repository/register_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> with RegisterRepository {
  RegisterBloc() : super(RegisterInitial()) {
    // on<RegisterEvent>((event, emit) {
    //   // TODO: implement event handler
    // });

    on<RegisterScreenInfoEvent>((event, emit) async {

      try {
        emit(RegisterLoading());
        Response response = await getScreenRegister();
        emit(RegisterEndLoading());
        if (response.statusCode == 200) {
          ScreenRegisterResponse screenRegisterResponse =
          ScreenRegisterResponse.fromJson(response.data);
          if (screenRegisterResponse.head?.status == "200") {
            emit(RegisterScreenInfoSuccessState(response: screenRegisterResponse));
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
  }
}
