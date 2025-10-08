import 'package:drivevn/core/constants/app_color.dart';
import 'package:drivevn/core/constants/icon_path.dart';
import 'package:drivevn/feature/practice/practive_detail/bloc/practive_detail_bloc.dart';
import 'package:drivevn/widgets/button/button_fill.dart';
import 'package:drivevn/widgets/radio/radio_answer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PractiveDetailScreen extends StatefulWidget {
  const PractiveDetailScreen({super.key});

  @override
  State<PractiveDetailScreen> createState() => _PractiveDetailScreenState();
}

class _PractiveDetailScreenState extends State<PractiveDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<PractiveDetailBloc, PractiveDetailState>(
        builder: (context, state) {
          final bloc = context.read<PractiveDetailBloc>();
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
            ),
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
                    value: 0.5,
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
                            'Biển nào cấm người đi bộ qua lại? akuihdaiuhdaoidhaoishdaoisdh saodhasoidhasodhaso dhasoiuhdaoisd',
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
                          ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              RadioAnswerWidget(
                                value: 1,
                                groupValue: state.isSelected,
                                onChanged: (value) {
                                  bloc.add(
                                    SelectedAnswerEvent(
                                      questionIndex: 0,
                                      answerIndex: value,
                                    ),
                                  );
                                },
                                title: 'Biển cấm người đi bộ',
                              ),
                              RadioAnswerWidget(
                                value: 2,
                                groupValue: state.isSelected,
                                onChanged: (value) {
                                  bloc.add(
                                    SelectedAnswerEvent(
                                      questionIndex: 0,
                                      answerIndex: value,
                                    ),
                                  );
                                },
                                title: 'Biển cấm xe thô sơ',
                              ),
                              RadioAnswerWidget(
                                value: 3,
                                groupValue: state.isSelected,
                                onChanged: (value) {
                                  bloc.add(
                                    SelectedAnswerEvent(
                                      questionIndex: 0,
                                      answerIndex: value,
                                    ),
                                  );
                                },
                                title: 'Biển cấm xe gắn máy',
                              ),
                              RadioAnswerWidget(
                                value: 4,
                                groupValue: state.isSelected,
                                onChanged: (value) {
                                  bloc.add(
                                    SelectedAnswerEvent(
                                      questionIndex: 0,
                                      answerIndex: value,
                                    ),
                                  );
                                },
                                title: 'Biển cấm ô tô',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ButtonFill(
                    title: 'Câu tiếp theo',
                    color: AppColor.primary,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTimeView(BuildContext context) {
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
            'Câu 1/25',
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
  }
}
