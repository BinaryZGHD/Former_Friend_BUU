import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
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
  }
}
