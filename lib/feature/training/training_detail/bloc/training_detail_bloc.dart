import 'package:bloc/bloc.dart';
import 'package:drivevn/core/enums/loading_status.dart';
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
