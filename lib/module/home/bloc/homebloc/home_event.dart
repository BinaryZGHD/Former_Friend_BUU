part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}
class HomeScreenInfoEvent extends HomeEvent{
  String globalkey;
  HomeScreenInfoEvent(  {required this.globalkey,});
}
class OnClickHomeLanguageEvent extends HomeEvent{
  String globalkey;
  OnClickHomeLanguageEvent(  {required this.globalkey,});
}
class OnClickHomeLogoutEvent extends HomeEvent{
  String globalkey;
  OnClickHomeLogoutEvent(  {required this.globalkey,});
}
