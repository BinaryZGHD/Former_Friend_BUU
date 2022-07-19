import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:f2fbuu/module/activity/model/response/add_activity_screen_api.dart';
import 'package:f2fbuu/module/activity/model/response/add_edit.dart';
import 'package:f2fbuu/module/activity/model/response/delete.dart';
import 'package:f2fbuu/module/activity/repository/activity_repository.dart';
import 'package:meta/meta.dart';

part 'activity_event.dart';

part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState>
    with ActivityRepository {
  ActivityBloc() : super(ActivityInitial()) {
    on<AddActivityScreenInfoEvent>((event, emit) async {
      try {
        emit(ActivityLoading());
        Response response = await getScreenActivity();
        emit(ActivityEndLoading());
        if (response.statusCode == 200) {
          AddActivityScreenApi screenActivityResponse =
              AddActivityScreenApi.fromJson(response.data);
          if (screenActivityResponse.head?.status == "200") {
            emit(ActivityScreenInfoSuccessState(
                response: screenActivityResponse));
          } else {
            emit(ActivityError(
                message: screenActivityResponse.head?.message ?? ""));
          }
        } else {
          emit(ActivityError(message: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ActivityError(message: e.response?.statusMessage ?? ""));
      }
    });
    on<SubmitAddEditActivityEvent>((event, emit) async {
      try {
        emit(ActivityLoading());
        Response responseAddEditSubmit = await submitAddEditActivity(
            event.id,
            event.activityName,
            event.year,
            event.term,
            event.sDate,
            event.fDate,
            event.totalTime,
            event.venue,
            event.approver,
            event.detail);
        emit(ActivityEndLoading());
        if (responseAddEditSubmit.statusCode == 200) {
          AddActivityScreenApi screenActivityResponse =
              AddActivityScreenApi.fromJson(responseAddEditSubmit.data);
          if (screenActivityResponse.head?.status == "200") {
            emit(ActivityScreenInfoSuccessState(
                response: screenActivityResponse));
          } else {
            emit(ActivityError(
                message: screenActivityResponse.head?.message ?? ""));
          }
        } else {
          emit(ActivityError(
              message: responseAddEditSubmit.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ActivityError(message: e.response?.statusMessage ?? ""));
      }
    });
    on<SubmitDeleteActivityEvent>((event, emit) async {
      try {
        emit(ActivityDetailLoading());
        Response responseDeleteSubmit = await submitDeleteActivity(
          event.id,
        );
        emit(ActivityDetailEndLoading());

        if (responseDeleteSubmit.statusCode == 200) {
          try {
            DeleteResponse deleteResponse =
                DeleteResponse.fromJson(responseDeleteSubmit.data);

            print("deleteResponse.head?.status + ${deleteResponse.head?.status}");

            if (deleteResponse.head?.status == 200) {
              emit(SubmitDeleteActivityState(responseDelete: deleteResponse));
            } else {
              print("ActivityError  + 1");
              emit(ActivityError(message: deleteResponse.head?.message ?? ""));
            }
          } catch (e) {
            emit(ActivityError(message: e.toString()));
          }
        } else {
          emit(ActivityError(message: responseDeleteSubmit.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ActivityError(message: e.response?.statusMessage ?? ""));
      }
    });
  }
}
