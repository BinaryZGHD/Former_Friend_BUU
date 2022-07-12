import 'package:flutter/cupertino.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:f2fbuu/module/activity/model/response/screen_status_activity.dart';
import 'package:f2fbuu/module/home/model/response/screen_home_response.dart';
import 'package:f2fbuu/module/home/repository/home_repository.dart';
import 'package:f2fbuu/module/profile/model/response/api_profile.dart';


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
          ScreenHomeResponse screenHomeResponse = ScreenHomeResponse.fromJson(responseHome.data);
          ApiProfileResponse apiProfileResponse = ApiProfileResponse.fromJson(responseProfile.data);
          ScreenStatusActivityResponse apiStatusActivityResponse = ScreenStatusActivityResponse.fromJson(responseActivity.data);

          if (screenHomeResponse.head?.status == 200 && apiProfileResponse.head?.status == 200 && apiStatusActivityResponse.head?.status == "200") {
            emit(HomeScreenInfoSuccessState(responseHome: screenHomeResponse, responseProfile: apiProfileResponse, responseActivity: apiStatusActivityResponse));
          } else {
            emit(HomeError(message: screenHomeResponse.head?.message ?? ""));
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
