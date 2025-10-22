import 'package:drivevn/core/constants/app_color.dart';
import 'package:drivevn/core/constants/icon_path.dart';
import 'package:drivevn/core/router/router_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'components/training_item_widget.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Luyện tập",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColor.primary,
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Luyện tập theo chủ đề',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Hãy chọn chủ đề luyện tập',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                children: [
                  TrainingItemWidget(
                    title: 'Khái niệm và quy tắc giao thông',
                    subTitle: '25 câu',
                    icon: IconPath.justiceScale,
                    onTap: () {
                      context.push(RouterPath.trainingQuestions);
                    },
                  ),
                  const SizedBox(height: 8),
                  TrainingItemWidget(
                    title: 'Nghiệp vụ vận tải',
                    subTitle: '25 câu',
                    icon: IconPath.supplyChain,
                    onTap: () {
                      context.push(RouterPath.trainingQuestions);
                    },
                  ),
                  const SizedBox(height: 8),
                  TrainingItemWidget(
                    title: 'Kỹ thuật lái xe',
                    subTitle: '25 câu',
                    icon: IconPath.trafficLight,
                    onTap: () {
                      context.push(RouterPath.trainingQuestions);
                    },
                  ),
                  const SizedBox(height: 8),
                  TrainingItemWidget(
                    title: 'Biển báo đường bộ',
                    subTitle: '25 câu',
                    icon: IconPath.roadSign,
                    onTap: () {
                      context.push(RouterPath.trainingQuestions);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
