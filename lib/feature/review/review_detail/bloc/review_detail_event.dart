part of 'review_detail_bloc.dart';

class ReviewDetailEvent {
  const ReviewDetailEvent();
}

class LoadQuestionsEvent extends ReviewDetailEvent {
  const LoadQuestionsEvent();
}

class SelectedAnswerEvent extends ReviewDetailEvent {
  final int answerIndex;

  const SelectedAnswerEvent({
    required this.answerIndex,
  });
}

class NextQuestionEvent extends ReviewDetailEvent {
  const NextQuestionEvent();
}

class BackQuestionEvent extends ReviewDetailEvent {
  const BackQuestionEvent();
}
