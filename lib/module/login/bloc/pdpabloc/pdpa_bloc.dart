import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:f2fbuu/module/login/model/response/screen_pdpa_response.dart';
import 'package:f2fbuu/module/login/repository/pdpa_repository.dart';
import 'package:meta/meta.dart';



part 'pdpa_event.dart';
part 'pdpa_state.dart';

class PdpaBloc extends Bloc<PdpaEvent, PdpaState> with PDPARepository{
  PdpaBloc() : super(PdpaInitial()) {
    on<PdpaEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<PDPAScreenInfoEvent>((event, emit) async {

      try {
        emit(PDPALoading());
        Response response = await getScreenPDPA();
        emit(PDPAEndLoading());
        if (response.statusCode == 200) {
          ScreenPDPAResponse screenForgotPasswordResponse =
          ScreenPDPAResponse.fromJson(response.data);
          if (screenForgotPasswordResponse.head?.status == "200") {
            emit(PDPAScreenInfoSuccessState(response: screenForgotPasswordResponse));
          } else {
            emit(PDPAError(message: screenForgotPasswordResponse.head?.message ?? ""));
          }
        } else {
          emit(PDPAError(message: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(PDPAError(message: e.response?.statusMessage ?? ""));
      }

    });
  }
}
