import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'training_detail_event.dart';
part 'training_detail_state.dart';

class TrainingDetailBloc extends Bloc<TrainingDetailEvent, TrainingDetailState> {
  TrainingDetailBloc() : super(TrainingDetailInitial()) {
    on<TrainingDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
