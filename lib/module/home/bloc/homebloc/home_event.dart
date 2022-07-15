part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}
class HomeScreenInfoEvent extends HomeEvent{
}
class OnClickHomeLanguageEvent extends HomeEvent{
  final String userLanguage;
  OnClickHomeLanguageEvent({ required this.userLanguage});
}
class OnClickHomeLogoutEvent extends HomeEvent{
}
