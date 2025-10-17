import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'training_questions_event.dart';
part 'training_questions_state.dart';

class TrainingQuestionsBloc
    extends Bloc<TrainingQuestionsEvent, TrainingQuestionsState> {
  TrainingQuestionsBloc() : super(const TrainingQuestionsState()) {
    on<TrainingQuestionsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
