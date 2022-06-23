
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../model/response/screen_home.dart';
import '../repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> with HomeRepository {
  HomeBloc() : super(HomeInitial()) {
    on<HomeScreenInfoEvent>((event, emit) async {

      try {
        emit(HomeLoading());
        Response response = await getScreenHome();
        emit(HomeEndLoading());
        if (response.statusCode == 200) {
          ScreenHomeResponse screenLoginResponse =
          ScreenHomeResponse.fromJson(response.data);
          if (screenLoginResponse.head?.status == "200") {
            emit(HomeScreenInfoSuccessState(response: screenLoginResponse));
          } else {
            emit(HomeError(message: screenLoginResponse.head?.message ?? ""));
          }
        } else {
          emit(HomeError(message: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(HomeError(message: e.response?.statusMessage ?? ""));
      }

    });
  }
}
