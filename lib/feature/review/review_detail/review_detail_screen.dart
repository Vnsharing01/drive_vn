import 'package:drivevn/core/constants/app_color.dart';
import 'package:drivevn/core/constants/icon_path.dart';
import 'package:drivevn/core/enums/loading_status.dart';
import 'package:drivevn/core/router/router_path.dart';
import 'package:drivevn/core/utils/notification_bar/notification_bar.dart';
import 'package:drivevn/feature/review/review_detail/bloc/review_detail_bloc.dart';
import 'package:drivevn/widgets/button/button_fill.dart';
import 'package:drivevn/widgets/radio/radio_answer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ReviewDetailScreen extends StatefulWidget {
  const ReviewDetailScreen({super.key});

  @override
  State<ReviewDetailScreen> createState() => _ReviewDetailScreenState();
}

class _ReviewDetailScreenState extends State<ReviewDetailScreen> {
  @override
  void initState() {
    _loadData();
    super.initState();
  }

  Future _loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      context.read<ReviewDetailBloc>().add(const LoadQuestionsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Ôn Tập",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go(RouterPath.main),
          ),
        ),
        body: BlocBuilder<ReviewDetailBloc, ReviewDetailState>(
          builder: (context, state) {
            final bloc = context.read<ReviewDetailBloc>();
            if (state.isLoading.isLoading && state.questions.isEmpty) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24,
              ),
              child: Column(
                children: [
                  Card.outlined(
                    elevation: 2,
                    color: AppColor.background,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.questions[state.currentQuestionIndex]
                                    .question ??
                                '',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 16),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset(
                              IconPath.roadSign,
                              height: 200,
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildAnswerView(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),
                  Row(
                    children: [
                      if (state.currentQuestionIndex > 0) ...[
                        Expanded(
                          child: ButtonFill(
                            title: 'Câu trước',
                            color: AppColor.primary.withOpacity(0.7),
                            onTap: () {
                              bloc.add(const BackQuestionEvent());
                            },
                          ),
                        ),
                      ],
                      const SizedBox(width: 16),
                      if (state.currentQuestionIndex <
                          state.questions.length - 1) ...[
                        Expanded(
                          child: ButtonFill(
                            title: 'Câu tiếp theo',
                            color: AppColor.primary,
                            onTap: () {
                              if (state.isSelected <= 0) {
                                notiWarningWidget(
                                  context,
                                  message: 'Vui lòng chọn đáp án',
                                );
                                return;
                              }
                              bloc.add(const NextQuestionEvent());
                            },
                          ),
                        ),
                      ]
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildAnswerView() {
    return BlocBuilder<ReviewDetailBloc, ReviewDetailState>(
      builder: (context, state) {
        final bloc = context.read<ReviewDetailBloc>();
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final answer =
                state.questions[state.currentQuestionIndex].answers![index];
            return RadioAnswerWidget(
              value: answer.id ?? 1,
              groupValue: state.isSelected,
              onChanged: (value) {
                bloc.add(
                  SelectedAnswerEvent(
                    answerIndex: value,
                  ),
                );
              },
              title: answer.answer ?? '',
            );
          },
          separatorBuilder: (_, int index) => const SizedBox(height: 8),
          itemCount:
              state.questions[state.currentQuestionIndex].answers!.length,
        );
      },
    );
  }
}
