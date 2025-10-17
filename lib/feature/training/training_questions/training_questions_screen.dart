import 'package:drivevn/data/models/question_model.dart';
import 'package:drivevn/feature/training/training_questions/bloc/training_questions_bloc.dart';
import 'package:drivevn/feature/training/training_questions/components/questions_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainingQuestionsScreen extends StatefulWidget {
  const TrainingQuestionsScreen({super.key});

  @override
  State<TrainingQuestionsScreen> createState() =>
      _TrainingQuestionsScreenState();
}

class _TrainingQuestionsScreenState extends State<TrainingQuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    final testQuestions = List.generate(
      25,
      (index) => QuestionModel(
        id: '${index + 1}',
        question: '1',
      ),
    );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Danh sách câu hỏi",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<TrainingQuestionsBloc, TrainingQuestionsState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 16,
              ),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: testQuestions.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 100,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  final item = testQuestions[index];
                  return QuestionsButtonWidget(
                    item: item,
                    onTap: () {},
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
