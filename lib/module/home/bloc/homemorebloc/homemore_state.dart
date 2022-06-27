part of 'homemore_bloc.dart';

@immutable
abstract class HomemoreState {}

class HomemoreInitial extends HomemoreState {}
class HomeMoreBoardStudentLoading extends HomemoreState{

}

class HomeMoreBoardStudentEndLoading extends HomemoreState{

}

class HomeMoreBoardStudentError extends HomemoreState{
  String message;
  HomeMoreBoardStudentError({required this.message});
}
class HomeMoreBoardStudentSuccessState extends HomemoreState{
  ScreenHomeMoreBoardStudentResponse  responseBoardStudent;

  HomeMoreBoardStudentSuccessState({required this.responseBoardStudent});
}
class HomeMoreBoardTeacherLoading extends HomemoreState{

}

class HomeMoreBoardTeacherEndLoading extends HomemoreState{

}

class HomeMoreBoardTeacherError extends HomemoreState{
  String message;
  HomeMoreBoardTeacherError({required this.message});
}
class HomeMoreBoardTeacherSuccessState extends HomemoreState{
  ScreenHomeMoreBoardTeacherResponse  responseBoardTeacher;

  HomeMoreBoardTeacherSuccessState({required this.responseBoardTeacher});
}





