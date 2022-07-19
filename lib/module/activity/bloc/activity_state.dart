part of 'activity_bloc.dart';

@immutable
abstract class ActivityState {
  const ActivityState();
}

class ActivityInitial extends ActivityState {}

class ActivityLoading extends ActivityState{

}

class ActivityEndLoading extends ActivityState{

}

class ActivityError extends ActivityState{
  String message;
  ActivityError({required this.message});
}
class ActivityScreenInfoSuccessState extends ActivityState{
  AddActivityScreenApi response;
  ActivityScreenInfoSuccessState({required this.response});
}
class SubmitAddEditActivityState extends ActivityState{
  AddEditResponse responseAddEdit;
  SubmitAddEditActivityState({required this.responseAddEdit});
}
class SubmitDeleteActivityState extends ActivityState{
  DeleteResponse responseDelete;
  SubmitDeleteActivityState({required this.responseDelete});
}
class DefaultState extends ActivityState{
}