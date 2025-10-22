import 'package:drivevn/core/constants/app_color.dart';
import 'package:drivevn/core/constants/icon_path.dart';
import 'package:drivevn/core/router/router_path.dart';
import 'package:drivevn/feature/practice/practive_detail/bloc/practive_detail_bloc.dart';
import 'package:drivevn/widgets/button/button_fill.dart';
import 'package:drivevn/core/utils/notification_bar/notification_bar.dart';
import 'package:drivevn/widgets/radio/radio_answer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PractiveDetailScreen extends StatefulWidget {
  const PractiveDetailScreen({super.key});

  @override
  State<PractiveDetailScreen> createState() => _PractiveDetailScreenState();
}

class _PractiveDetailScreenState extends State<PractiveDetailScreen> {
  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future _loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      context.read<PractiveDetailBloc>().add(const LoadQuestionsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<PractiveDetailBloc, PractiveDetailState>(
        listener: (context, state) {},
        builder: (context, state) {
          final bloc = context.read<PractiveDetailBloc>();

          if (state.isLoading == false && state.questions.isEmpty) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Bắt đầu thi thử",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  context.go(RouterPath.main);
                },
              ),
            ),
            floatingActionButtonAnimator:
                FloatingActionButtonAnimator.noAnimation,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerTop,
            floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 80),
                  _buildTimeView(context),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: (state.currentQuestionIndex + 1) /
                        state.questions.length,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(8),
                    backgroundColor: Theme.of(context).focusColor,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(AppColor.primary),
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 64),
                  Card.outlined(
                    elevation: 2,
                    color: AppColor.background,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state
                                .questions[state.currentQuestionIndex].question ?? '',
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
                  const SizedBox(height: 8),
                  state.currentQuestionIndex == state.questions.length - 1
                      ? ButtonFill(
                          title: 'Hoàn thành',
                          color: AppColor.error,
                          onTap: () {
                            if (state.isSelected <= 0) {
                              notiWarningWidget(
                                context,
                                message: 'Vui lòng chọn đáp án',
                              );
                              return;
                            }
                            context.go(RouterPath.practiceFinish);
                          },
                        )
                      : ButtonFill(
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAnswerView() {
    return BlocBuilder<PractiveDetailBloc, PractiveDetailState>(
      builder: (context, state) {
        final bloc = context.read<PractiveDetailBloc>();
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
          itemCount: state.questions[state.currentQuestionIndex].answers!.length,
        );
      },
    );
  }

  Widget _buildTimeView(BuildContext context) {
    return BlocBuilder<PractiveDetailBloc, PractiveDetailState>(
      builder: (context, state) {
        final sumQuitz = state.questions.length;
        final currentQuitz = state.currentQuestionIndex + 1;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.topBanner,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).focusColor,
              width: 1,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Câu $currentQuitz/$sumQuitz',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColor.success,
                    ),
              ),
              Wrap(
                children: [
                  Text(
                    '⏱',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    '15:00',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColor.error,
                        ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
