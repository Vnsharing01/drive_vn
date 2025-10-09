part of 'practive_detail_bloc.dart';

class PractiveDetailEvent {
  const PractiveDetailEvent();
}

class LoadQuestionsEvent extends PractiveDetailEvent {
  const LoadQuestionsEvent();
  
}

class SelectedAnswerEvent extends PractiveDetailEvent {
  final int answerIndex;
  final int questionIndex;
  const SelectedAnswerEvent({
    required this.answerIndex,
    required this.questionIndex,
  });
}
