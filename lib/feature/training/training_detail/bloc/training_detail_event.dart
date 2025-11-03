part of 'training_detail_bloc.dart';

class TrainingDetailEvent {
  const TrainingDetailEvent();
}

class LoadQuestionsEvent extends TrainingDetailEvent {
  const LoadQuestionsEvent();
}

class SelectedAnswerEvent extends TrainingDetailEvent {
  final int answerIndex;

  const SelectedAnswerEvent({
    required this.answerIndex,
  });
}

class NextQuestionEvent extends TrainingDetailEvent {
  const NextQuestionEvent();
}
class BackQuestionEvent extends TrainingDetailEvent {
  const BackQuestionEvent();
}
