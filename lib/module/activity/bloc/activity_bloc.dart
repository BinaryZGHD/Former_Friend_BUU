import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'activity_event.dart';
part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  ActivityBloc() : super(ActivityInitial()) {
    on<AddActivityScreenInfoEvent>((event, emit)  async {

      try {
        emit(ActivityLoading());
        Response response = await getScreenActivity();
        emit(ActivityEndLoading());
        if (response.statusCode == 200) {
          ScreenActivityResponse screenActivityResponse =
          ScreenActivityResponse.fromJson(response.data);
          if (screenActivityResponse.head?.status == "200") {
            emit(ActivityScreenInfoSuccessState(response: screenActivityResponse));
          } else {
            emit(ActivityError(message: screenActivityResponse.head?.message ?? ""));
          }
        } else {
          emit(ActivityError(message: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ActivityError(message: e.response?.statusMessage ?? ""));
      }
    });
  }
}
