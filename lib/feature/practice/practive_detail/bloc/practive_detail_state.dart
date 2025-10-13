part of 'practive_detail_bloc.dart';

class PractiveDetailState extends Equatable {
  final int currentQuestionIndex;
  final List<QuestionModel> questions;
  final List<AnswersModel> answers; // questionIndex -> answerIndex
  final bool isLoading;
  final int isSelected;

  const PractiveDetailState({
    this.currentQuestionIndex = 1,
    this.questions = const [],
    this.answers = const [],
    this.isLoading = false,
    this.isSelected = 1,
  });

  

  PractiveDetailState copyWith({
    int? currentQuestionIndex,
    List<QuestionModel>? questions,
    List<AnswersModel>? answers,
    bool? isLoading,
    int? isSelected,
  }) {
    return PractiveDetailState(
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      questions: questions ?? this.questions,
      answers: answers ?? this.answers,
      isLoading: isLoading ?? this.isLoading,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object> get props => [
        currentQuestionIndex,
        questions,
        answers,
        isLoading,
        isSelected,
      ];
}
