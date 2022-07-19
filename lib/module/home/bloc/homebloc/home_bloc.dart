import 'package:dio/dio.dart';
import 'package:f2fbuu/module/home/model/response/alert_delete_account_response.dart';
import 'package:f2fbuu/module/home/model/response/alert_logout_response.dart';
import 'package:f2fbuu/module/home/model/response/alert_noactivity_respone.dart';
import 'package:f2fbuu/module/home/model/response/logout_home_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:bloc/bloc.dart';
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
        Response responseAlertNoActivityResponse = await getApiNoActivity();
        emit(HomeEndLoading());
        if (responseHome.statusCode == 200 && responseProfile.statusCode == 200 && responseActivity.statusCode == 200) {
          ScreenHomeResponse screenHomeResponse = ScreenHomeResponse.fromJson(responseHome.data);
          ApiProfileResponse apiProfileResponse = ApiProfileResponse.fromJson(responseProfile.data);
          ScreenStatusActivityResponse apiStatusActivityResponse =
              ScreenStatusActivityResponse.fromJson(responseActivity.data);
          AlertNoActivityResponse alertNoActivityResponse = AlertNoActivityResponse.fromJson(responseAlertNoActivityResponse.data);
          print(alertNoActivityResponse.body?.noactiviry);
          if (screenHomeResponse.head?.status == 200 &&
              apiProfileResponse.head?.status == 200 &&
              apiStatusActivityResponse.head?.status == "200") {
            emit(ScreenInfoHomeSuccessState(
                responseScreenInfoHome: screenHomeResponse,
                responseProfile: apiProfileResponse,
                responseActivity: apiStatusActivityResponse,
                responseNoActivity: alertNoActivityResponse));
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

    on<OnClickHomeLanguageEvent>((event, emit) async {
      try {
        emit(HomeLoading());
        Response responseHome = await getScreenHome();
        Response responseProfile = await getApiProfile();
        Response responseActivity = await getApiActivity();
        Response responseAlertNoActivityResponse = await getApiNoActivity();
        emit(HomeEndLoading());
        if (responseHome.statusCode == 200 && responseProfile.statusCode == 200 && responseActivity.statusCode == 200) {
          ScreenHomeResponse screenHomeResponse = ScreenHomeResponse.fromJson(responseHome.data);
          ApiProfileResponse apiProfileResponse = ApiProfileResponse.fromJson(responseProfile.data);
          ScreenStatusActivityResponse apiStatusActivityResponse =
              ScreenStatusActivityResponse.fromJson(responseActivity.data);
          AlertNoActivityResponse alertNoActivityResponse = AlertNoActivityResponse.fromJson(responseAlertNoActivityResponse.data);

          if (screenHomeResponse.head?.status == 200 &&
              apiProfileResponse.head?.status == 200 &&
              apiStatusActivityResponse.head?.status == "200") {
            emit(OnClickScreenInfoHomeSuccessState(
                responseScreenInfoHome: screenHomeResponse,
                responseProfile: apiProfileResponse,
                responseActivity: apiStatusActivityResponse,
                responseNoActivity: alertNoActivityResponse));
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

    on<OnClickHomeLogoutEvent>((event, emit) async {
      try {
        emit(HomeAlertLoading());
        Response responseAlertLogout = await getAlertLogout();
        emit(HomeEndLoading());
        if (responseAlertLogout.statusCode == 200) {
          AlertLogoutHomeResponse alertLogoutHomeResponse = AlertLogoutHomeResponse.fromJson(responseAlertLogout.data);
          if (alertLogoutHomeResponse.head?.status == 200) {
            emit(OnClickHomeLogoutState(responseAlertLogoutHome: alertLogoutHomeResponse));
          } else {
            emit(HomeError(message: alertLogoutHomeResponse.head?.message ?? ""));
          }
        } else {
          emit(HomeError(message: responseAlertLogout.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(HomeError(message: e.response?.statusMessage ?? ""));
      }
    });

    on<OnClickConfirmHomeLogoutEvent>((event, emit) async {
      try {
        emit(HomeLoading());
        Response responseLogoutHome = await getLogoutHome();
        emit(HomeEndLoading());
        if (responseLogoutHome.statusCode == 200) {
          LogoutHomeResponse logoutHomeResponse = LogoutHomeResponse.fromJson(responseLogoutHome.data);
          if (logoutHomeResponse.head?.status == 200) {
            emit(OnClickConfirmHomeLogoutState());
          } else {
            emit(HomeError(message: logoutHomeResponse.head?.message ?? ""));
          }
        } else {
          emit(HomeError(message: responseLogoutHome.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(HomeError(message: e.response?.statusMessage ?? ""));
      }
    });

    on<OnClickDeleteAccountEvent>((event, emit) async {
      try {
        emit(HomeAlertLoading());
        Response responseAlertLogout = await getAlertDeleteAccount();
        emit(HomeEndLoading());
        if (responseAlertLogout.statusCode == 200) {
          AlertDeleteAccountResponse alertDeleteAccountResponse =
              AlertDeleteAccountResponse.fromJson(responseAlertLogout.data);
          if (alertDeleteAccountResponse.head?.status == 200) {
            emit(OnClickDeleteAccountState(responseAlertDeleteAccount: alertDeleteAccountResponse));
          } else {
            emit(HomeError(message: alertDeleteAccountResponse.head?.message ?? ""));
          }
        } else {
          emit(HomeError(message: responseAlertLogout.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(HomeError(message: e.response?.statusMessage ?? ""));
      }
    });

    on<OnClickConfirmDeleteAccountEvent>((event, emit) async {
      try {
        emit(HomeLoading());
        Response responseLogoutHome = await getLogoutHome();
        emit(HomeEndLoading());
        if (responseLogoutHome.statusCode == 200) {
          LogoutHomeResponse logoutHomeResponse = LogoutHomeResponse.fromJson(responseLogoutHome.data);
          if (logoutHomeResponse.head?.status == 200) {
            emit(OnClickConfirmDeleteAccountState());
          } else {
            emit(HomeError(message: logoutHomeResponse.head?.message ?? ""));
          }
        } else {
          emit(HomeError(message: responseLogoutHome.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(HomeError(message: e.response?.statusMessage ?? ""));
      }
    });
  }
}
