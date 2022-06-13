import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent,MainState>{
  MainBloc() : super(MianInitState()){
    on<MainSetCurrentEvent>((event,emit){
      emit(MainCurrentIndexState(index: event.index));
    });
    on<MainTokenChackEvent>((event,emit){
      if(event.Tokenkey != ""){
        emit(MainTokenCheckState(statuscheck: true));
      }else{
        emit(MainTokenCheckState(statuscheck: false));
      }


    });
  }
}
