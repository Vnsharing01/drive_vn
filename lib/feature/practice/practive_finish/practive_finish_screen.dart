import 'package:drivevn/core/constants/app_color.dart';
import 'package:drivevn/core/constants/icon_path.dart';
import 'package:drivevn/core/router/router_path.dart';
import 'package:drivevn/feature/practice/practive_finish/bloc/practive_finish_bloc.dart';
import 'package:drivevn/widgets/button/button_fill.dart';
import 'package:drivevn/widgets/button/button_outline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PractiveFinishScreen extends StatefulWidget {
  const PractiveFinishScreen({super.key});

  @override
  State<PractiveFinishScreen> createState() => _PractiveFinishScreenState();
}

class _PractiveFinishScreenState extends State<PractiveFinishScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PractiveFinishBloc, PractiveFinishState>(
      builder: (context, state) {
        // final bloc = context.read<PractiveFinishBloc>();
        return SafeArea(
          child: Scaffold(
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
            body: SingleChildScrollView(
              child: Column(
                children: [
                  _buildNotificationBanner(),
                  const SizedBox(height: 24),
                  Card.outlined(
                    elevation: 2,
                    color: AppColor.background,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 24,
                      ),
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kết quả chi tiết',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  // fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 16),
                          _buildInfoView(
                            context,
                            title: 'Số câu đúng',
                            value: '2 câu',
                            valueColor: AppColor.primary,
                          ),
                          const SizedBox(height: 8),
                          _buildInfoView(
                            context,
                            title: 'Số câu sai',
                            value: '23 câu',
                            valueColor: AppColor.error,
                          ),
                          const SizedBox(height: 8),
                          _buildInfoView(
                            context,
                            title: 'Tỷ lệ đúng',
                            value: '8%',
                            valueColor: AppColor.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ButtonFill(
                      title: 'Về trang chủ',
                      color: state.isPassed ? AppColor.primary : AppColor.error,
                      onTap: () {
                        context.go(RouterPath.main);
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ButtonOutline(
                      title: 'Thi lại',
                      color: state.isPassed ? AppColor.primary : AppColor.error,
                      onTap: () {
                        context.push(RouterPath.practice);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNotificationBanner() {
    return BlocBuilder<PractiveFinishBloc, PractiveFinishState>(
      builder: (context, state) {
        return Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: state.isPassed ? AppColor.primary : AppColor.error,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                state.isPassed ? IconPath.happy : IconPath.crying,
                width: 72,
                height: 72,
              ),
              const SizedBox(height: 8),
              Text(
                state.isPassed
                    ? 'Chúc mừng! Bạn đã đạt'
                    : 'Rất tiếc! Bạn chưa đạt',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Điểm: 2/25',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoView(
    BuildContext context, {
    String? title,
    String? value,
    Color valueColor = AppColor.textPrimary,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$title: ",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
        ),
        Text(
          "$value",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: valueColor,
                fontSize: 18,
              ),
        ),
      ],
    );
  }
}
