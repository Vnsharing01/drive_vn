import 'package:drivevn/data/models/question_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'practive_detail_event.dart';
part 'practive_detail_state.dart';

class PractiveDetailBloc
    extends Bloc<PractiveDetailEvent, PractiveDetailState> {
  PractiveDetailBloc() : super(const PractiveDetailState()) {
    on<SelectedAnswerEvent>((event, emit) {
      final Map<int, int> answers = Map.from(state.answers);
      answers[event.questionIndex] = event.answerIndex;
      emit(
        const PractiveDetailState().copyWith(answers: {
          ...answers,
          event.questionIndex: event.questionIndex,
        }),
      );
    });
  }
}
