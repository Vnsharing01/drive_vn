import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'latest_test_model.g.dart';

@JsonSerializable()
@CopyWith()
class LatestTestModel {
  final String? id; // id của lần thi mới nhất
  final int? totalTest; // sô lần thi
  final int? correctQuestions; // số câu đúng
  final int? wrongQuestions; // số câu sai
  final int? passRate; // số câu sai

  LatestTestModel({
    this.id,
    this.totalTest = 0,
    this.correctQuestions = 0,
    this.wrongQuestions = 0,
    this.passRate = 0,
  });

   factory LatestTestModel.fromJson(Map<String, dynamic> json) =>
      _$LatestTestModelFromJson(json);
  Map<String, dynamic> toJson() => _$LatestTestModelToJson(this);
}
