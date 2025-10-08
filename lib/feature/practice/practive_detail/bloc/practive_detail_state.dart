part of 'practive_detail_bloc.dart';

class PractiveDetailState extends Equatable {
  final int currentQuestionIndex;
  final List<QuestionModel> questions;
  final Map<int, int> answers; // questionIndex -> answerIndex
  final bool isLoading;
  final int isSelected;
  
  const PractiveDetailState({
    this.currentQuestionIndex = 0,
    this.questions = const [],
    this.answers = const {},
    this.isLoading = false,
    this.isSelected = 1,
  });

  PractiveDetailState copyWith({
    int? currentQuestionIndex,
    List<QuestionModel>? questions,
    Map<int, int>? answers,
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
