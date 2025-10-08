
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'practive_finish_event.dart';
part 'practive_finish_state.dart';

class PractiveFinishBloc extends Bloc<PractiveFinishEvent, PractiveFinishState> {
  PractiveFinishBloc() : super(const PractiveFinishState()) {
    on<PractiveFinishEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
