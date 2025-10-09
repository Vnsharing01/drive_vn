import 'dart:math';

import 'package:drivevn/data/models/question_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'practive_detail_event.dart';
part 'practive_detail_state.dart';

class PractiveDetailBloc
    extends Bloc<PractiveDetailEvent, PractiveDetailState> {
  PractiveDetailBloc() : super(const PractiveDetailState()) {
    final List<QuestionModel> questions = [
      QuestionModel(
        id: '1',
        question: 'Biển báo này có ý nghĩa gì?',
        answers: [
          'Biển cấm người đi bộ',
          'Biển cấm xe thô sơ',
          'Biển cấm xe gắn máy',
          'Biển cấm ô tô',
        ],
        correctAnswerIndex: 0,
      ),
      QuestionModel(
        id: '2',
        question: 'Khi gặp biển báo “Cấm rẽ trái”, người lái xe phải làm gì?',
        answers: [
          'Không được rẽ trái',
          'Được phép rẽ trái nếu đường vắng',
          'Chỉ được đi thẳng',
          'Chỉ được quay đầu xe',
        ],
        correctAnswerIndex: 0,
      ),
    ];

    on<LoadQuestionsEvent>((event, emit) {
      emit(state.copyWith(questions: questions));
    });

    on<SelectedAnswerEvent>((event, emit) {
      // final Map<int, int> answers = Map.from(state.answers);
      // answers[event.questionIndex] = event.answerIndex;
      // Or if you want to generate mock data for all 25 questions:
      Map<int, int> generateMockAnswers(int totalQuestions) {
        final Map<int, int> mockAnswers = {};
        final random = Random();

        // Answer about 60% of questions randomly
        for (int i = 0; i < totalQuestions; i++) {
          if (random.nextDouble() < 0.6) {
            mockAnswers[i] =
                random.nextInt(4); // Assuming 4 options per question
          }
        }

        return mockAnswers;
      }

// Usage:
      Map<int, int> answers = generateMockAnswers(4);
      emit(
        state.copyWith(
          answers: answers,
          currentQuestionIndex: event.questionIndex,
        ),
      );
    });
  }
}
