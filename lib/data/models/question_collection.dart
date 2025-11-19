import 'package:drivevn/data/models/answer_collection.dart';
import 'package:isar_community/isar.dart';

part 'question_collection.g.dart';

@collection
class QuestionCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late int number;

  late String question;

  late String category;

  String? hinhanhq;

  late String explanation;

  final answers = IsarLinks<AnswerCollection>();
}
