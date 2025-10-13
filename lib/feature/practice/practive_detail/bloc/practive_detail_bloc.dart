import 'package:drivevn/data/models/answers_model.dart';
import 'package:drivevn/data/models/question_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'practive_detail_event.dart';
part 'practive_detail_state.dart';

class PractiveDetailBloc
    extends Bloc<PractiveDetailEvent, PractiveDetailState> {
  PractiveDetailBloc() : super(const PractiveDetailState()) {
    on<LoadQuestionsEvent>((event, emit) {
      emit(state.copyWith(
        questions: questions,
        isLoading: true,
      ));
    });

    on<SelectedAnswerEvent>((event, emit) {
      final List<AnswersModel> upadateAnswers = [];
      final answers = List<AnswersModel>.from(state.answers);

      for (var answer in answers) {
        if (answer.id == event.answerIndex) {
          answer.copyWith(isCorrect: true);
        }

        upadateAnswers.add(answer);
      }

      if (upadateAnswers.isNotEmpty) {
        emit(
          state.copyWith(
            answers: upadateAnswers,
            currentQuestionIndex: event.questionIndex,
          ),
        );
      }
    });
  }

  final List<QuestionModel> questions = [
    QuestionModel(
      id: '1',
      question: 'Biển báo này có ý nghĩa gì?',
      answers: [
        AnswersModel(
          id: 1,
          questionId: 1,
          answer: 'Biển cấm người đi bộ',
        ),
        AnswersModel(
          id: 2,
          questionId: 1,
          answer: 'Biển cấm xe thô sơ',
        ),
        AnswersModel(
          id: 3,
          questionId: 1,
          answer: 'Biển cấm xe gắn máy',
        ),
        AnswersModel(
          id: 4,
          questionId: 1,
          answer: 'Biển cấm ô tô',
        ),
      ],
      correctAnswerIndex: 4,
    ),
    QuestionModel(
      id: '2',
      question: 'Khi gặp biển báo “Cấm rẽ trái”, người lái xe phải làm gì?',
      answers: [
        AnswersModel(
          id: 1,
          questionId: 2,
          answer: 'Không được rẽ trái',
        ),
        AnswersModel(
          id: 2,
          questionId: 2,
          answer: 'Được phép rẽ trái nếu đường vắng',
        ),
        AnswersModel(
          id: 3,
          questionId: 2,
          answer: 'Chỉ được đi thẳng',
        ),
        AnswersModel(
          id: 4,
          questionId: 2,
          answer: 'Chỉ được quay đầu xe',
        ),
      ],
      correctAnswerIndex: 3,
    ),
  ];
}
