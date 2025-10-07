import 'package:drivevn/core/constants/app_color.dart';
import 'package:drivevn/core/utils/router/router_path.dart';
import 'package:drivevn/widgets/button/button_fill.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PractiveStartScreen extends StatefulWidget {
  const PractiveStartScreen({super.key});

  @override
  State<PractiveStartScreen> createState() => _PractiveStartScreenState();
}

class _PractiveStartScreenState extends State<PractiveStartScreen> {
  @override
  Widget build(BuildContext context) {
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
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          child: Column(
            children: [
              Card.filled(
                elevation: 1.5,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Đề thi sát hạch',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(height: 16),
                      _buildInfoView(
                        context,
                        title: 'Số câu hỏi',
                        value: '25 câu',
                      ),
                      const Divider(),
                      _buildInfoView(
                        context,
                        title: 'Thời gian',
                        value: '20 phút',
                      ),
                      const Divider(),
                      _buildInfoView(
                        context,
                        title: 'Điểm đạt',
                        value: '21/25 câu (≥84%)',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ButtonFill(
                title: 'Bắt đầu thi thử',
                color: AppColor.primary,
                onTap: () {
                  context.push(RouterPath.practiceFinish);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoView(
    BuildContext context, {
    String? title,
    String? value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$title: ",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          "$value",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
