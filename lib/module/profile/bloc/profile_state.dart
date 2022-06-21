part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {
  const ProfileState();
}

class ProfileApiSuccessState extends ProfileState{
  ApiProfileResponse  response;
  ProfileApiSuccessState({required this.response});
}

class ProfileError extends ProfileState{
  String errormessage;
  ProfileError({required this.errormessage});
}

class ProfileInitial extends ProfileState {
  @override
  String toString() => 'ProfileInitial';
}

class ProfileLoading extends ProfileState {
}

class ProfileLoadingSuccess extends ProfileState {

}

class ProfileStatusState extends ProfileState {
  bool statuscheck  ;
  ProfileStatusState({required this.statuscheck});
}