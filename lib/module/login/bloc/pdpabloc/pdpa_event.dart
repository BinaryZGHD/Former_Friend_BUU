part of 'pdpa_bloc.dart';

@immutable
abstract class PdpaEvent {}
class ScreenInfoPDPAEvent extends PdpaEvent{
  String userLanguage;
  ScreenInfoPDPAEvent({required this.userLanguage});
}
class OnClickPDPAEvent extends PdpaEvent{
  bool accept;
  OnClickPDPAEvent({required this.accept});
}