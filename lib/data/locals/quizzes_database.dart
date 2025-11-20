import 'dart:convert';

import 'package:drivevn/data/models/answer_collection.dart';
import 'package:drivevn/data/models/question_collection.dart';
import 'package:flutter/services.dart';
import 'package:isar_community/isar.dart';

class QuizzesDatabase {
  final Isar isar;

  QuizzesDatabase({required this.isar});

  /// hàm để import dữ liệu ban đầu vào database
  /// Chỉ chạy 1 lần khi database rỗng (lần đầu cài app)
  Future<void> importDatabase() async {
    // Đếm số lượng câu hỏi đã có trong database
    final questionCount = await isar.questionCollections.count();
    // Nếu đã có dữ liệu rồi thì return (tránh import lại)
    if (questionCount > 0) {
      // Database already seeded
      return;
    }

    // Đọc JSON từ assets
    final jsonString = await rootBundle.loadString(
      'assets/jsons/questions.json',
    );
    final List<dynamic> jsonList = json.decode(jsonString);

    final questions = <QuestionCollection>[];
    final answers = <AnswerCollection>[];

    for (var questionJson in jsonList) {
      // Tạo object QuestionCollection từ JSON
      final question =
          QuestionCollection()
            // Toán tử cascade (..) cho phép gọi nhiều setter liên tiếp
            ..number = questionJson['number']
            ..question = questionJson['question']
            ..category = questionJson['category']
            ..hinhanhq = questionJson['hinhanhq']
            ..explanation = questionJson['explanation'];

      for (var answerJson in questionJson['answers']) {
        // Tạo object AnswerCollection từ JSON
        final answer =
            AnswerCollection()
              ..text = answerJson['text']
              ..correct = answerJson['correct'];
        // Thêm answer vào IsarLinks của question (tạo quan hệ 1-nhiều)
        // question.answers là IsarLinks<AnswerCollection>
        question.answers.add(answer);
        answers.add(answer);
      }
      questions.add(question);
    }

    // writeTxn() tạo một transaction để ghi dữ liệu
    // Transaction đảm bảo: tất cả thành công hoặc tất cả thất bại (atomicity)
    await isar.writeTxn(() async {
      await isar.answerCollections.putAll(
        answers,
      ); // Insert answers (chưa có link)
      await isar.questionCollections.putAll(
        questions,
      ); // Insert question (chưa có link)
      for (var question in questions) {
        // save() lưu các links (quan hệ) đã add ở trên
        // Điều này tạo liên kết trong database giữa question và answers của nó
        await question.answers.save(); // Tạo link (BÂY GIỜ MỚI CÓ QUAN HỆ)
        /** Điều này làm: **
         * - Tạo bảng trung gian (junction table) trong Isar
         * - Lưu mapping: `question_id ↔ answer_ids`
         **Bảng ẩn `question_answer_links` (do Isar tự tạo):**
         */
      }
      // Phải insert answers TRƯỚC, vì:
      // - answers cần có ID
      // - question.answers.save() cần answer IDs để tạo link
      // đảm bảo Integrity (Tính toàn vẹn dữ liệu)
      // tăng Performance
    });
  }
}
