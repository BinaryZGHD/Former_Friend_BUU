import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../activity/model/response/screen_status_activity.dart';
import '../../../profile/model/response/api_profile.dart';
import '../../model/response/screen_home.dart';
import '../../repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> with HomeRepository {
  HomeBloc() : super(HomeInitial()) {
    on<HomeScreenInfoEvent>((event, emit) async {

      try {
        emit(HomeLoading());
        Response responseHome = await getScreenHome();
        Response responseProfile = await getApiProfile();
        Response responseActivity = await getApiActivity();
        emit(HomeEndLoading());
        if (responseHome.statusCode == 200 && responseProfile.statusCode == 200 && responseActivity.statusCode == 200) {
          ScreenHomeResponse screenLoginResponse = ScreenHomeResponse.fromJson(responseHome.data);
          ApiProfileResponse apiProfileResponse = ApiProfileResponse.fromJson(responseProfile.data);
          ScreenStatusActivityResponse apiStatusActivityResponse = ScreenStatusActivityResponse.fromJson(responseActivity.data);

          if (responseHome.statusCode == 200 && responseProfile.statusCode == 200 && responseActivity.statusCode == 200) {
            emit(HomeScreenInfoSuccessState(responseHome: screenLoginResponse, responseProfile: apiProfileResponse, responseActivity: apiStatusActivityResponse));
          } else {
            emit(HomeError(message: screenLoginResponse.head?.message ?? ""));
          }
        } else {
          emit(HomeError(message: responseHome.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(HomeError(message: e.response?.statusMessage ?? ""));
      }

    });
  }
}
