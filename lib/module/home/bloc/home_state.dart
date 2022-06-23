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
  ScreenHomeResponse  response;
  HomeScreenInfoSuccessState({required this.response});
}

