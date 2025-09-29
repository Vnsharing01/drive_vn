import 'package:drivevn/core/constants/app_color.dart';
import 'package:flutter/material.dart';

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
              fontSize: 28,
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
                                  fontSize: 24,
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
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.textPrimary.withOpacity(0.5),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: const Text(
                    "Bắt đầu thi",
                    style: TextStyle(
                      color: AppColor.textWhite,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
