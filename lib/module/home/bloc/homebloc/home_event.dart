part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}
class HomeScreenInfoEvent extends HomeEvent{
}
class OnClickChangeLanguageHomeEvent extends HomeEvent{
  final String userLanguage;
  OnClickChangeLanguageHomeEvent({ required this.userLanguage});
}
class OnClickLogoutHomeEvent extends HomeEvent{
}
class OnClickConfirmLogoutHomeEvent extends HomeEvent{
}

class OnClickDeleteAccountHomeEvent extends HomeEvent{
}
class OnClickConfirmDeleteAccountHomeEvent extends HomeEvent{
}
