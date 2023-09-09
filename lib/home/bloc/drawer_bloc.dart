import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'drawer_event.dart';
// part 'drawer_state.dart';

class DrawerBloc extends Bloc<DrawerEvent, bool> {
  DrawerBloc() : super(false) {
    on<UnlockTopic>((event, emit) {
      // TODO: implement event handler
      emit(true);
    });
  }
}
