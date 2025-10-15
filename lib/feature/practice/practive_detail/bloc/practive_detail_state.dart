part of 'practive_detail_bloc.dart';

class PractiveDetailState extends Equatable {
  final int currentQuestionIndex;
  final List<QuestionModel> questions;
  final bool isLoading;
  final int isSelected;

  const PractiveDetailState({
    this.currentQuestionIndex = 0,
    this.questions = const [],
    this.isLoading = false,
    this.isSelected = 0,
  });

  

  PractiveDetailState copyWith({
    int? currentQuestionIndex,
    List<QuestionModel>? questions,
    bool? isLoading,
    int? isSelected,
  }) {
    return PractiveDetailState(
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      questions: questions ?? this.questions,
      isLoading: isLoading ?? this.isLoading,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object> get props => [
        currentQuestionIndex,
        questions,
        isLoading,
        isSelected,
      ];
}
