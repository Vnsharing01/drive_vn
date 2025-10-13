import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'answers_model.g.dart';

@JsonSerializable()
@CopyWith()
class AnswersModel {
  final int? id;
  final int? questionId;
  final String? answer;
  final bool? isCorrect;

  AnswersModel({
    this.id,
    this.answer,
    this.isCorrect,
    this.questionId,
  });

  factory AnswersModel.fromJson(Map<String, dynamic> json) =>
      _$AnswersModelFromJson(json);
  Map<String, dynamic> toJson() => _$AnswersModelToJson(this);
}
