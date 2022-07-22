part of 'activity_bloc.dart';

// @immutable
abstract class ActivityEvent {}

class AddEditActivityScreenInfoEvent extends ActivityEvent {}
class SubmitAddEditActivityEvent extends ActivityEvent {
  String id;
  String activityName;
  String year;
  String term;
  String sDate;
  String fDate;
  String totalTime;
  String venue;
  String approver;
  String detail;
  SubmitAddEditActivityEvent({
    required this.id,
    required this.activityName,
    required this.year,
    required this.term,
    required this.sDate,
    required this.fDate,
    required this.totalTime,
    required this.venue,
    required this.approver,
    required this.detail,
});
}
class SubmitDeleteActivityEvent extends ActivityEvent {
  String id;
  SubmitDeleteActivityEvent({
    required this.id,
});
}

