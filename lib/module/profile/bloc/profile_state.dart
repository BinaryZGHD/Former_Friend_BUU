part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {
  const ProfileState();
}

class ProfileApiSuccessState extends ProfileState{
  ApiProfileResponse  response;
  ProfileApiSuccessState({required this.response});
}

class ChangeAvatarProcress extends ProfileState {
}

class ChooseAvatarSuccess extends ProfileState {
  final avatarimg;
  ChooseAvatarSuccess({required this.avatarimg});
}


class ProfileError extends ProfileState{
  var errormessage;
  ProfileError({required this.errormessage});
}

class ProfileInitial extends ProfileState {
  @override
   toString() => 'ProfileInitial';
}

class ProfileLoading extends ProfileState {
}

class ProfileLoadingSuccess extends ProfileState {

}

class ProfileStatusState extends ProfileState {
  bool statuscheck  ;
  ProfileStatusState({required this.statuscheck});
}

