part of 'pdpa_bloc.dart';

@immutable
abstract class PdpaEvent {}
class PDPAScreenInfoEvent extends PdpaEvent{
  String userLanguage;
  PDPAScreenInfoEvent({required this.userLanguage});
}
class OnClickPDPAEvent extends PdpaEvent{
  bool accept;
  OnClickPDPAEvent({required this.accept});
}