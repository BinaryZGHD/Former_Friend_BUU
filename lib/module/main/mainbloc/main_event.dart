part of 'main_bloc.dart';

@immutable

abstract class MainEvent {}
class MainSetCurrentEvent extends MainEvent {
  int index ;
  MainSetCurrentEvent({required this.index});
}

class MainTokenChackEvent extends MainEvent {
  String Tokenkey ;
  MainTokenChackEvent({required this.Tokenkey});
}