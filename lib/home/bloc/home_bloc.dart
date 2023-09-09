import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../repositories/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, int> {
  final HomeRepository homeRepository;
  HomeBloc({required this.homeRepository}) : super(1) {
    on<ChangeTopic>((event, emit) {
      // TODO: implement event handler
      emit(event.topicIndex);
    });
  }
}
