part of 'more_bloc.dart';

abstract class MoreState {}
class MoreInitial extends MoreState {}
class MoreScreenInfoSuccessState extends MoreState {
  ScreenMoreResponse responseScreenMore;

  MoreScreenInfoSuccessState({required this.responseScreenMore});
}
class MoreError extends MoreState {
  String message;
  MoreError({required this.message});
}


class MoreLoading extends MoreState {}

class MoreEndLoading extends MoreState {}
class MorePDPALoading extends MoreState {}

class MorePDPAEndLoading extends MoreState {}
class MorePDPAError extends MoreState {
  String message;
  MorePDPAError({required this.message});
}


class MorePDPASuccessState extends MoreState {
  ScreenMorePDPAResponse responsePDPA;

  MorePDPASuccessState({required this.responsePDPA});
}
// ----------------------->

class MoreFAQLoading extends MoreState {}

class MoreFAQEndLoading extends MoreState {}

class MoreFAQError extends MoreState {
  String message;
  MoreFAQError({required this.message});
}

class MoreFAQSuccessState extends MoreState {
  ScreenMoreFAQResponse responseFAQ;

  MoreFAQSuccessState({required this.responseFAQ});
}
// ----------------------->

class MoreContactUsLoading extends MoreState{

}

class MoreContactUsEndLoading extends MoreState{

}

class MoreContactUsError extends MoreState{
  String message;
  MoreContactUsError({required this.message});
}
class MoreContactUsSuccessState extends MoreState{
  ScreenMoreContactUsResponse  responseContactUs;

  MoreContactUsSuccessState({required this.responseContactUs});
}
// ----------------------->



class MoreBoardStudentLoading extends MoreState {}

class MoreBoardStudentEndLoading extends MoreState {}

class MoreBoardStudentError extends MoreState {
  String message;
  MoreBoardStudentError({required this.message});
}

class MoreBoardStudentSuccessState extends MoreState {
  ScreenMoreBoardStudentResponse responseBoardStudent;

  MoreBoardStudentSuccessState({required this.responseBoardStudent});
}

// ----------------------->
class MoreBoardTeacherLoading extends MoreState {}

class MoreBoardTeacherEndLoading extends MoreState {}

class MoreBoardTeacherError extends MoreState {
  String message;
  MoreBoardTeacherError({required this.message});
}

class MoreBoardTeacherSuccessState extends MoreState {
  ScreenMoreBoardTeacherResponse responseBoardTeacher;

  MoreBoardTeacherSuccessState({required this.responseBoardTeacher});
}

// ----------------------->

class MoreDetailStudentLoading extends MoreState {}

class MoreDetailStudentEndLoading extends MoreState {}

class MoreDetailStudentError extends MoreState {
  String message;
  MoreDetailStudentError({required this.message});
}

class MoreDetailStudentSuccessState extends MoreState {
  ScreenMoreBoardStudentListDetailResponse responseDetailStudent;

  MoreDetailStudentSuccessState({required this.responseDetailStudent});
}
