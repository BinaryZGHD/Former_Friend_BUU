part of 'homemore_bloc.dart';

@immutable
abstract class HomemoreState {}

class HomemoreInitial extends HomemoreState {}


class HomeMorePDPALoading extends HomemoreState {}

class HomeMorePDPAEndLoading extends HomemoreState {}

class HomeMorePDPAError extends HomemoreState {
  String message;
  HomeMorePDPAError({required this.message});
}

class HomeMorePDPASuccessState extends HomemoreState {
  ScreenHomeMorePDPAResponse responsePDPA;

  HomeMorePDPASuccessState({required this.responsePDPA});
}
// ----------------------->

class HomeMoreFAQLoading extends HomemoreState {}

class HomeMoreFAQEndLoading extends HomemoreState {}

class HomeMoreFAQError extends HomemoreState {
  String message;
  HomeMoreFAQError({required this.message});
}

class HomeMoreFAQSuccessState extends HomemoreState {
  ScreenHomeMoreFAQResponse responseFAQ;

  HomeMoreFAQSuccessState({required this.responseFAQ});
}
// ----------------------->

class HomeMoreContactUsLoading extends HomemoreState{

}

class HomeMoreContactUsEndLoading extends HomemoreState{

}

class HomeMoreContactUsError extends HomemoreState{
  String message;
  HomeMoreContactUsError({required this.message});
}
class HomeMoreContactUsSuccessState extends HomemoreState{
  ScreenHomeMoreContactUsResponse  responseContactUs;

  HomeMoreContactUsSuccessState({required this.responseContactUs});
}
// ----------------------->



class HomeMoreBoardStudentLoading extends HomemoreState {}

class HomeMoreBoardStudentEndLoading extends HomemoreState {}

class HomeMoreBoardStudentError extends HomemoreState {
  String message;
  HomeMoreBoardStudentError({required this.message});
}

class HomeMoreBoardStudentSuccessState extends HomemoreState {
  ScreenHomeMoreBoardStudentResponse responseBoardStudent;

  HomeMoreBoardStudentSuccessState({required this.responseBoardStudent});
}

// ----------------------->
class HomeMoreBoardTeacherLoading extends HomemoreState {}

class HomeMoreBoardTeacherEndLoading extends HomemoreState {}

class HomeMoreBoardTeacherError extends HomemoreState {
  String message;
  HomeMoreBoardTeacherError({required this.message});
}

class HomeMoreBoardTeacherSuccessState extends HomemoreState {
  ScreenHomeMoreBoardTeacherResponse responseBoardTeacher;

  HomeMoreBoardTeacherSuccessState({required this.responseBoardTeacher});
}

// ----------------------->

class HomeMoreDetailStudentLoading extends HomemoreState {}

class HomeMoreDetailStudentEndLoading extends HomemoreState {}

class HomeMoreDetailStudentError extends HomemoreState {
  String message;
  HomeMoreDetailStudentError({required this.message});
}

class HomeMoreDetailStudentSuccessState extends HomemoreState {
  ScreenHomeMoreBoardStudentListDetailResponse responseDetailStudent;

  HomeMoreDetailStudentSuccessState({required this.responseDetailStudent});
}