import 'package:drivevn/data/models/answers_model.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question_model.g.dart';

@JsonSerializable()
@CopyWith()
class QuestionModel {
  final String ?id;
  final String ?question;
  final List<AnswersModel> ?answers;
  final int ?correctAnswerIndex;

  QuestionModel({
     this.id,
     this.question,
     this.answers,
     this.correctAnswerIndex,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}
