import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'training_questions_event.dart';
part 'training_questions_state.dart';

class TrainingQuestionsBloc extends Bloc<TrainingQuestionsEvent, TrainingQuestionsState> {
  TrainingQuestionsBloc() : super(TrainingQuestionsInitial()) {
    on<TrainingQuestionsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
