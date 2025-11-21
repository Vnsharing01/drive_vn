import 'package:drivevn/data/models/question_collection.dart';
import 'package:isar_community/isar.dart';

part 'answer_collection.g.dart';

@collection
class AnswerCollection {
  Id id = Isar.autoIncrement;

  late String text;

  late bool correct;

  @Backlink(to: 'answers')
  final question = IsarLink<QuestionCollection>();

  AnswerCollection copyWith({String? text, bool? correct}) {
    return AnswerCollection()
      ..text = text ?? this.text
      ..correct = correct ?? this.correct;
  }
}
