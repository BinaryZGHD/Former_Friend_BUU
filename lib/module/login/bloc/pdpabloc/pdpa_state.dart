part of 'pdpa_bloc.dart';

@immutable
abstract class PdpaState {}

class PdpaInitial extends PdpaState {}
class  PDPAScreenInfoSuccessState extends PdpaState{
  ScreenPDPAResponse  response;

  PDPAScreenInfoSuccessState({required this.response});

}
class PDPALoading extends PdpaState{

}

class PDPAEndLoading extends PdpaState{

}

class PDPAError extends PdpaState{
  String message;
  PDPAError({required this.message});
}

class PDPAAccept extends PdpaState{

}

class PDPADecline extends PdpaState{

}