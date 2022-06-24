import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'homemore_event.dart';
part 'homemore_state.dart';

class HomemoreBloc extends Bloc<HomemoreEvent, HomemoreState> {
  HomemoreBloc() : super(HomemoreInitial()) {
    on<HomemoreEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
