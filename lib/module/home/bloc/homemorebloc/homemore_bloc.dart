
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:f2fbuu/module/home/bloc/homebloc/home_bloc.dart';
import 'package:f2fbuu/module/home/model/response/scree_homemore_pdpa_response.dart';
import 'package:f2fbuu/module/home/model/response/screen_homemore_board_student_list_detail_response.dart';
import 'package:f2fbuu/module/home/model/response/screen_homemore_board_student_response.dart';
import 'package:f2fbuu/module/home/model/response/screen_homemore_board_teacher_response.dart';
import 'package:f2fbuu/module/home/model/response/screen_homemore_contact_response.dart';
import 'package:f2fbuu/module/home/model/response/screen_homemore_faq_response.dart';

import 'package:f2fbuu/module/home/repository/homemore_repository.dart';
import 'package:f2fbuu/module/login/model/response/screen_pdpa_response.dart';
import 'package:meta/meta.dart';

part 'homemore_event.dart';
part 'homemore_state.dart';

class HomemoreBloc extends Bloc<HomemoreEvent, HomemoreState> with HomeMoreRepository{
  HomemoreBloc() : super(HomemoreInitial()) {
    on<HomemoreEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<HomeMorePDPAEvent>((event, emit) async {

      try {
        emit(HomeMorePDPALoading());
        Response responseHomeMorePDPA = await getScreenHomeMorePDPA();
        emit(HomeMorePDPAEndLoading());
        if (responseHomeMorePDPA.statusCode == 200) {
          ScreenHomeMorePDPAResponse screenHomeMorePDPAResponse = ScreenHomeMorePDPAResponse.fromJson(responseHomeMorePDPA.data);
          if (screenHomeMorePDPAResponse.head?.status == "200") {
            emit(HomeMorePDPASuccessState(responsePDPA: screenHomeMorePDPAResponse,));
          } else {
            emit(HomeMorePDPAError(message: screenHomeMorePDPAResponse.head?.message ?? ""));
          }
        } else {
          emit(HomeMorePDPAError(message: responseHomeMorePDPA.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(HomeMorePDPAError(message: e.response?.statusMessage ?? ""));
      }

    });

    on<HomeMoreFAQEvent>((event, emit) async {

      try {
        emit(HomeMoreFAQLoading());
        Response responseHomeMoreFAQ = await getScreenHomeMoreFAQ();
        emit(HomeMoreFAQEndLoading());
        if (responseHomeMoreFAQ.statusCode == 200) {
          ScreenHomeMoreFAQResponse screenHomeMoreFAQResponse = ScreenHomeMoreFAQResponse.fromJson(responseHomeMoreFAQ.data);
          if (screenHomeMoreFAQResponse.head?.status == "200") {
            emit(HomeMoreFAQSuccessState(responseFAQ: screenHomeMoreFAQResponse));
          } else {
            emit(HomeMoreFAQError(message: screenHomeMoreFAQResponse.head?.message ?? ""));
          }
        } else {
          emit(HomeMoreFAQError(message: responseHomeMoreFAQ.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(HomeMoreFAQError(message: e.response?.statusMessage ?? ""));
      }

    });


    on<HomeMoreContactUsEvent>((event, emit) async {

      try {
        emit(HomeMoreContactUsLoading());
        Response responseHomeMoreContactUs = await getScreenHomeMoreContactUs();
        emit(HomeMoreContactUsEndLoading());
        if (responseHomeMoreContactUs.statusCode == 200) {
          ScreenHomeMoreContactUsResponse screenHomeMoreContactUsResponse = ScreenHomeMoreContactUsResponse.fromJson(responseHomeMoreContactUs.data);
          if (screenHomeMoreContactUsResponse.head?.status == "200") {
            emit(HomeMoreContactUsSuccessState(responseContactUs: screenHomeMoreContactUsResponse));
          } else {
            emit(HomeMoreContactUsError(message: screenHomeMoreContactUsResponse.head?.message ?? ""));
          }
        } else {
          emit(HomeMoreContactUsError(message: responseHomeMoreContactUs.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(HomeMoreContactUsError(message: e.response?.statusMessage ?? ""));
      }

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
    on<HomeMoreDetailStudentEvent>((event, emit) async {

      try {
        emit(HomeMoreDetailStudentLoading());
        Response responseHomeMoreDetailStudent = await getScreenHomeMoreDetailStudent();
        emit(HomeMoreDetailStudentEndLoading());
        if (responseHomeMoreDetailStudent.statusCode == 200) {
          ScreenHomeMoreBoardStudentListDetailResponse screenHomeMoreDetailStudentResponse = ScreenHomeMoreBoardStudentListDetailResponse.fromJson(responseHomeMoreDetailStudent.data);
          if (screenHomeMoreDetailStudentResponse.head?.status == "200") {
            emit(HomeMoreDetailStudentSuccessState(responseDetailStudent: screenHomeMoreDetailStudentResponse));
          } else {
            emit(HomeMoreDetailStudentError(message: screenHomeMoreDetailStudentResponse.head?.message ?? ""));
          }
        } else {
          emit(HomeMoreDetailStudentError(message: responseHomeMoreDetailStudent.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(HomeMoreDetailStudentError(message: e.response?.statusMessage ?? ""));
      }

    });



  }
}
