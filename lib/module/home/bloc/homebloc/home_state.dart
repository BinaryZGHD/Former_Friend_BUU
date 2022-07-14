part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState{

}

class HomeEndLoading extends HomeState{

}

class HomeError extends HomeState{
  String message;
  HomeError({required this.message});
}
class ScreenInfoHomeSuccessState extends HomeState{
  ScreenHomeResponse  responseScreenInfoHome;
  ApiProfileResponse responseProfile;
  ScreenStatusActivityResponse responseActivity;
  ScreenInfoHomeSuccessState({required this.responseScreenInfoHome, required this.responseProfile, required this.responseActivity});
}class OnClickScreenInfoHomeSuccessState extends HomeState{
  ScreenHomeResponse  responseScreenInfoHome;
  ApiProfileResponse responseProfile;
  ScreenStatusActivityResponse responseActivity;
  OnClickScreenInfoHomeSuccessState({required this.responseScreenInfoHome, required this.responseProfile, required this.responseActivity});
}
//
// class HomeActivityStatus extends HomeState{
//   String message;
//   HomeActivityStatus({required this.message});
// }
class OnClickHomeLogoutState extends HomeState{

}