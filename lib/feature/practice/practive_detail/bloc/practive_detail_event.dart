part of 'practive_detail_bloc.dart';

class PractiveDetailEvent {
  const PractiveDetailEvent();
}

class LoadQuestionsEvent extends PractiveDetailEvent {
  const LoadQuestionsEvent();
  
}

class SelectedAnswerEvent extends PractiveDetailEvent {
  final int answerIndex;

  const SelectedAnswerEvent({
    required this.answerIndex,
  });
}
