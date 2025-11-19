import 'dart:convert';

import 'package:drivevn/data/models/answer_collection.dart';
import 'package:drivevn/data/models/question_collection.dart';
import 'package:flutter/services.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

class QuizzesDatabase {
  static Isar? _isar;

  static Future<void> initialize() async {
    if (_isar != null) return;

    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [QuestionCollectionSchema, AnswerCollectionSchema],
      directory: dir.path,
      name: 'quizzesDB',
    );

    await _seedDatabase();
  }

  static Isar get isar {
    if (_isar == null) {
      throw Exception('Isar database has not been initialized.');
    }
    return _isar!;
  }

  static Future<void> _seedDatabase() async {
    final questionCount = await isar.questionCollections.count();
    if (questionCount > 0) {
      // Database already seeded
      return;
    }

    final jsonString = await rootBundle.loadString(
      'assets/jsons/questions.json',
    );
    final List<dynamic> jsonList = json.decode(jsonString);

    final questions = <QuestionCollection>[];
    final answers = <AnswerCollection>[];

    for (var questionJson in jsonList) {
      final question =
          QuestionCollection()
            ..number = questionJson['number']
            ..question = questionJson['question']
            ..category = questionJson['category']
            ..hinhanhq = questionJson['hinhanhq']
            ..explanation = questionJson['explanation'];

      for (var answerJson in questionJson['answers']) {
        final answer =
            AnswerCollection()
              ..text = answerJson['text']
              ..correct = answerJson['correct'];
        question.answers.add(answer);
        answers.add(answer);
      }
      questions.add(question);
    }

    await isar.writeTxn(() async {
      await isar.answerCollections.putAll(answers);
      await isar.questionCollections.putAll(questions);
      for (var question in questions) {
        await question.answers.save();
      }
    });
  }
}
