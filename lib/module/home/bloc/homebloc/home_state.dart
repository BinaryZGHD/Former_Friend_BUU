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
class HomeScreenInfoSuccessState extends HomeState{
  ScreenHomeResponse  responseHome;
  ApiProfileResponse responseProfile;
  ScreenStatusActivityResponse responseActivity;
  HomeScreenInfoSuccessState({required this.responseHome, required this.responseProfile, required this.responseActivity});
}

class HomeActivityStatus extends HomeState{
  String message;
  HomeActivityStatus({required this.message});
}