part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class MianInitState extends MainState{}
class MainCurrentIndexState extends MainState{
  int index;
  MainCurrentIndexState({required this.index});
}
class MainTokenCheckState extends MainState{
  bool statuscheck ;
  MainTokenCheckState({required this.statuscheck});
}

