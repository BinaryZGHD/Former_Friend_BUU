
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:f2fbuu/module/home/model/response/screen_homemore_board_student_response.dart';
import 'package:f2fbuu/module/home/model/response/screen_homemore_board_teacher_response.dart';

import 'package:f2fbuu/module/home/repository/homemore_repository.dart';
import 'package:meta/meta.dart';

part 'homemore_event.dart';
part 'homemore_state.dart';

class HomemoreBloc extends Bloc<HomemoreEvent, HomemoreState> with HomeMoreRepository{
  HomemoreBloc() : super(HomemoreInitial()) {
    on<HomemoreEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<HomeMoreBoardStudentEvent>((event, emit) async {

      try {
        emit(HomeMoreBoardStudentLoading());
        Response responseHomeMoreBoardStudent = await getScreenHomeMoreBoardStudent();
        emit(HomeMoreBoardStudentEndLoading());
        if (responseHomeMoreBoardStudent.statusCode == 200) {
          ScreenHomeMoreBoardStudentResponse screenHomeMoreBoardStudentResponse = ScreenHomeMoreBoardStudentResponse.fromJson(responseHomeMoreBoardStudent.data);
          if (screenHomeMoreBoardStudentResponse.head?.status == "200") {
            emit(HomeMoreBoardStudentSuccessState(responseBoardStudent: screenHomeMoreBoardStudentResponse));
          } else {
            emit(HomeMoreBoardStudentError(message: screenHomeMoreBoardStudentResponse.head?.message ?? ""));
          }
        } else {
          emit(HomeMoreBoardStudentError(message: responseHomeMoreBoardStudent.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(HomeMoreBoardStudentError(message: e.response?.statusMessage ?? ""));
      }

    });
    on<HomeMoreBoardTeacherEvent>((event, emit) async {

      try {
        emit(HomeMoreBoardTeacherLoading());
        Response responseHomeMoreBoardTeacher = await getScreenHomeMoreBoardTeacher();
        emit(HomeMoreBoardTeacherEndLoading());
        if (responseHomeMoreBoardTeacher.statusCode == 200) {
          ScreenHomeMoreBoardTeacherResponse screenHomeMoreBoardTeacherResponse = ScreenHomeMoreBoardTeacherResponse.fromJson(responseHomeMoreBoardTeacher.data);
          if (screenHomeMoreBoardTeacherResponse.head?.status == "200") {
            emit(HomeMoreBoardTeacherSuccessState(responseBoardTeacher: screenHomeMoreBoardTeacherResponse));
          } else {
            emit(HomeMoreBoardTeacherError(message: screenHomeMoreBoardTeacherResponse.head?.message ?? ""));
          }
        } else {
          emit(HomeMoreBoardTeacherError(message: responseHomeMoreBoardTeacher.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(HomeMoreBoardTeacherError(message: e.response?.statusMessage ?? ""));
      }

    });
  }
}
