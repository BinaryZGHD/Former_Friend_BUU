part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class ChangeAvatarRequest extends ProfileEvent {
}

class OpenImagePicker extends ProfileEvent {
  final ImageSource imageSource;

  OpenImagePicker(this.imageSource);
}

class ProvideImagePath extends ProfileEvent {
  final String avatarPath;
  ProvideImagePath(this.avatarPath);
}

class ProfileDescriptionChanged extends ProfileEvent {
  final String description;

  ProfileDescriptionChanged(this.description);
}

//----------------------------------API---------------------------------------//
class ProfileApiEvent extends ProfileEvent {
}
class ProfileGeneralSummitEvent extends ProfileEvent {
  bool istextbuttonpressed;
  ProfileGeneralSummitEvent({required this.istextbuttonpressed});
}
class ProfileGeneralUpdateEvent extends ProfileEvent {
  String name;
  String surname;
  String nickname;
  String stuCode;
  String gen;
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
