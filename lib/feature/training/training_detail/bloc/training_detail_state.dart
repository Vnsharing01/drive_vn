part of 'training_detail_bloc.dart';

class TrainingDetailState extends Equatable {
  final LoadingStatus isLoading;
  final int isSelected;
  final int currentQuestionIndex;
  final List<QuestionModel> questions;

  const TrainingDetailState({
    this.isLoading = LoadingStatus.inital,
    this.isSelected = 0,
    this.currentQuestionIndex = 0,
    this.questions = const [],
  });

  TrainingDetailState copyWith({
    LoadingStatus? isLoading,
    int? isSelected,
    int? currentQuestionIndex,
    List<QuestionModel>? questions,
  }) {
    return TrainingDetailState(
      isLoading: isLoading ?? this.isLoading,
      isSelected: isSelected ?? this.isSelected,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      questions: questions ?? this.questions,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        isSelected,
        currentQuestionIndex,
        questions,
      ];
}
