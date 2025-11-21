import 'package:drivevn/core/constants/get_it.dart';
import 'package:drivevn/core/enums/loading_status.dart';
import 'package:drivevn/data/models/answer_collection.dart';
import 'package:drivevn/data/models/question_collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar_community/isar.dart';

part 'review_detail_event.dart';
part 'review_detail_state.dart';

class ReviewDetailBloc extends Bloc<ReviewDetailEvent, ReviewDetailState> {
  ReviewDetailBloc() : super(const ReviewDetailState()) {
    final questions = isarInstance.questionCollections.where().findAllSync();
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

      final answers = List<AnswerCollection>.from(curentQuestion.answers.toList());

      for (var answer in answers) {
        if (answer.id == event.answerIndex) {
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
