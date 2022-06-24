part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class ChangeAvatarRequest extends ProfileEvent {
}



class SaveProfileChanges extends ProfileEvent {}


//----------------------------------API---------------------------------------//
class ProfileApiEvent extends ProfileEvent {
}
class ProfileGeneralSummitEvent extends ProfileEvent {
  bool istextbuttonpressed;
  ProfileGeneralSummitEvent({required this.istextbuttonpressed});
}
class ProfileGeneralUpdateEvent extends ProfileEvent {
  var name;
  var surname;
  var nickname;
  var stuCode;
  var  gen;
  ProfileGeneralUpdateEvent(
      {
        required this.name,
        required this.surname,
        required this.nickname,
        required this.stuCode,
        required this.gen
      }
      );
}
