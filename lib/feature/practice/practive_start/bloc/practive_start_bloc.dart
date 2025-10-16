import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'practive_start_event.dart';
part 'practive_start_state.dart';

class PractiveStartBloc extends Bloc<PractiveStartEvent, PractiveStartState> {
  PractiveStartBloc() : super(PractiveStartInitial()) {
    on<PractiveStartEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
