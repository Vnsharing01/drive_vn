class QuestionModel {
  final String id;
  final String question;
  final List<String> answers;
  final int correctAnswerIndex;

  QuestionModel({
    required this.id,
    required this.question,
    required this.answers,
    required this.correctAnswerIndex,
  });
}
