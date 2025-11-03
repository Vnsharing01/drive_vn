import 'package:bloc/bloc.dart';
import 'package:drivevn/core/enums/loading_status.dart';
import 'package:drivevn/data/locals/mock_quitzs_db.dart';
import 'package:drivevn/data/models/answers_model.dart';
import 'package:drivevn/data/models/question_model.dart';
import 'package:equatable/equatable.dart';

part 'training_detail_event.dart';
part 'training_detail_state.dart';

class TrainingDetailBloc
    extends Bloc<TrainingDetailEvent, TrainingDetailState> {
  TrainingDetailBloc() : super(const TrainingDetailState()) {
    on<LoadQuestionsEvent>((event, emit) {
      if (state.questions.isEmpty) {
        emit(state.copyWith(
          isLoading: LoadingStatus.loading,
        ));
      }
      Future.delayed(const Duration(milliseconds: 1500));
      emit(state.copyWith(
        questions: questions,
        isLoading: LoadingStatus.success,
      ));
    });

    on<SelectedAnswerEvent>((event, emit) {
      final curentQuestion = state.questions[state.currentQuestionIndex];

      final answers = List<AnswersModel>.from(curentQuestion.answers ?? []);

      for (var answer in answers) {
        if (answer.id == event.answerIndex) {
          answer = answer.copyWith(isCorrect: true);
          emit(
            state.copyWith(
              isSelected: event.answerIndex,
            ),
          );
        }
      }
    });

    on<NextQuestionEvent>((event, emit) {
      emit(
        state.copyWith(
          currentQuestionIndex: state.currentQuestionIndex + 1,
          isSelected: 0,
        ),
      );
    });

    on<BackQuestionEvent>((event, emit) {
      emit(
        state.copyWith(
          currentQuestionIndex: state.currentQuestionIndex - 1,
          isSelected: 0,
        ),
      );
    });
  }

 
}
