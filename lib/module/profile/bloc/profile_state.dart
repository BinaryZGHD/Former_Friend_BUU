part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {
  const ProfileState();
}

class ProfileApiSuccessState extends ProfileState{
  ApiProfileResponse  response;
  ProfileApiSuccessState({required this.response});
}

class ProfileErrorState extends ProfileState{
  String errormessage;
  ProfileErrorState({required this.errormessage});
}

class ProfileInitial extends ProfileState {
  @override
  String toString() => 'ProfileInitial';
}

class ProfileLoading extends ProfileState {
  @override
  String toString() => 'ProfileLoading';
}

class ProfileLoadingSuccess extends ProfileState {
  @override
  String toString() => 'ProfileLoadingsuccess';
}

class ProfileStatusState extends ProfileState {
  bool statuscheck  ;
  ProfileStatusState({required this.statuscheck});
}