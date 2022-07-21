
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:f2fbuu/module/home/model/response/more_response/scree_more_pdpa_response.dart';
import 'package:f2fbuu/module/home/model/response/more_response/screen_more_board_student_list_detail_response.dart';
import 'package:f2fbuu/module/home/model/response/more_response/screen_more_board_student_response.dart';
import 'package:f2fbuu/module/home/model/response/more_response/screen_more_board_teacher_response.dart';
import 'package:f2fbuu/module/home/model/response/more_response/screen_more_contact_response.dart';
import 'package:f2fbuu/module/home/model/response/more_response/screen_more_faq_response.dart';
import 'package:f2fbuu/module/home/model/response/more_response/screen_more_response.dart';
import 'package:f2fbuu/module/home/repository/more_repository.dart';


part 'more_event.dart';
part 'more_state.dart';

class MoreBloc extends Bloc<MoreEvent, MoreState> with MoreRepository{
  bool isFetching = false;
  MoreBloc() : super(MoreInitial()) {
    on<MoreEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<MoreScreenInfoEvent>((event, emit) async {

      try {
        emit(MoreLoading());
        Response responseMorePDPA = await getScreenMoreInfo();
        emit(MoreEndLoading());
        if (responseMorePDPA.statusCode == 200) {
          ScreenMoreResponse screenMoreResponse = ScreenMoreResponse.fromJson(responseMorePDPA.data);
          if (screenMoreResponse.head?.status == 200) {
            emit(MoreScreenInfoSuccessState(responseScreenMore: screenMoreResponse,));
          } else {
            emit(MoreError(message: screenMoreResponse.head?.message ?? ""));
          }
        } else {
          emit(MoreError(message: responseMorePDPA.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(MoreError(message: e.response?.statusMessage ?? ""));
      }

    });
    on<MorePDPAEvent>((event, emit) async {

      try {
        emit(MorePDPALoading());
        Response responseMorePDPA = await getScreenMorePDPA();
        emit(MorePDPAEndLoading());
        if (responseMorePDPA.statusCode == 200) {
          ScreenMorePDPAResponse screenMorePDPAResponse = ScreenMorePDPAResponse.fromJson(responseMorePDPA.data);
          if (screenMorePDPAResponse.head?.status == "200") {
            emit(MorePDPASuccessState(responsePDPA: screenMorePDPAResponse,));
          } else {
            emit(MorePDPAError(message: screenMorePDPAResponse.head?.message ?? ""));
          }
        } else {
          emit(MorePDPAError(message: responseMorePDPA.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(MorePDPAError(message: e.response?.statusMessage ?? ""));
      }

    });

    on<MoreFAQEvent>((event, emit) async {

      try {
        emit(MoreFAQLoading());
        Response responseMoreFAQ = await getScreenMoreFAQ();
        emit(MoreFAQEndLoading());
        if (responseMoreFAQ.statusCode == 200) {
          ScreenMoreFAQResponse screenMoreFAQResponse = ScreenMoreFAQResponse.fromJson(responseMoreFAQ.data);
          if (screenMoreFAQResponse.head?.status == "200") {
            emit(MoreFAQSuccessState(responseFAQ: screenMoreFAQResponse));
          } else {
            emit(MoreFAQError(message: screenMoreFAQResponse.head?.message ?? ""));
          }
        } else {
          emit(MoreFAQError(message: responseMoreFAQ.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(MoreFAQError(message: e.response?.statusMessage ?? ""));
      }

    });


    on<MoreContactUsEvent>((event, emit) async {

      try {
        emit(MoreContactUsLoading());
        Response responseMoreContactUs = await getScreenMoreContactUs();
        emit(MoreContactUsEndLoading());
        if (responseMoreContactUs.statusCode == 200) {
          ScreenMoreContactUsResponse screenMoreContactUsResponse = ScreenMoreContactUsResponse.fromJson(responseMoreContactUs.data);
          if (screenMoreContactUsResponse.head?.status == "200") {
            emit(MoreContactUsSuccessState(responseContactUs: screenMoreContactUsResponse));
          } else {
            emit(MoreContactUsError(message: screenMoreContactUsResponse.head?.message ?? ""));
          }
        } else {
          emit(MoreContactUsError(message: responseMoreContactUs.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(MoreContactUsError(message: e.response?.statusMessage ?? ""));
      }

    });
    on<MoreBoardStudentEvent>((event, emit) async {

      try {
        emit(MoreBoardStudentLoading());
        Response responseMoreBoardStudent = await getScreenMoreBoardStudent();
        emit(MoreBoardStudentEndLoading());
        if (responseMoreBoardStudent.statusCode == 200) {
          ScreenMoreBoardStudentResponse screenMoreBoardStudentResponse = ScreenMoreBoardStudentResponse.fromJson(responseMoreBoardStudent.data);
          if (screenMoreBoardStudentResponse.head?.status == "200") {
            emit(MoreBoardStudentSuccessState(responseBoardStudent: screenMoreBoardStudentResponse));
          } else {
            emit(MoreBoardStudentError(message: screenMoreBoardStudentResponse.head?.message ?? ""));
          }
        } else {
          emit(MoreBoardStudentError(message: responseMoreBoardStudent.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(MoreBoardStudentError(message: e.response?.statusMessage ?? ""));
      }

    });
    on<MoreBoardTeacherEvent>((event, emit) async {

      try {
        emit(MoreBoardTeacherLoading());
        Response responseMoreBoardTeacher = await getScreenMoreBoardTeacher();
        emit(MoreBoardTeacherEndLoading());
        if (responseMoreBoardTeacher.statusCode == 200) {
          ScreenMoreBoardTeacherResponse screenMoreBoardTeacherResponse = ScreenMoreBoardTeacherResponse.fromJson(responseMoreBoardTeacher.data);
          if (screenMoreBoardTeacherResponse.head?.status == "200") {
            emit(MoreBoardTeacherSuccessState(responseBoardTeacher: screenMoreBoardTeacherResponse));
          } else {
            emit(MoreBoardTeacherError(message: screenMoreBoardTeacherResponse.head?.message ?? ""));
          }
        } else {
          emit(MoreBoardTeacherError(message: responseMoreBoardTeacher.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(MoreBoardTeacherError(message: e.response?.statusMessage ?? ""));
      }

    });
    on<MoreDetailStudentEvent>((event, emit) async {

      try {
        emit(MoreDetailStudentLoading());
        Response responseMoreDetailStudent = await getScreenMoreDetailStudent();
        emit(MoreDetailStudentEndLoading());
        if (responseMoreDetailStudent.statusCode == 200) {
          ScreenMoreBoardStudentListDetailResponse screenMoreDetailStudentResponse = ScreenMoreBoardStudentListDetailResponse.fromJson(responseMoreDetailStudent.data);
          if (screenMoreDetailStudentResponse.head?.status == "200") {
            emit(MoreDetailStudentSuccessState(responseDetailStudent: screenMoreDetailStudentResponse));
          } else {
            emit(MoreDetailStudentError(message: screenMoreDetailStudentResponse.head?.message ?? ""));
          }
        } else {
          emit(MoreDetailStudentError(message: responseMoreDetailStudent.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(MoreDetailStudentError(message: e.response?.statusMessage ?? ""));
      }

    });



  }
}
