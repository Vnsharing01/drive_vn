import 'package:drivevn/core/constants/app_color.dart';
import 'package:drivevn/core/constants/icon_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tutorialSteps = [
      {
        'title': '1. Luyện tập',
        'description':
            'Học theo từng chủ đề để nắm vững kiến thức lý thuyết lái xe',
        'icon': IconPath.luyentap,
      },
      {
        'title': '2. Thi thử',
        'description':
            'Làm đề thi thử 25 câu ngẫu nhiên như thi thật để đánh giá năng lực',
        'icon': IconPath.thiThu,
      },
      {
        'title': '3. Ôn lại',
        'description': 'Xem lại các câu đã sai để củng cố kiến thức',
        'icon': IconPath.onLai,
      },
      {
        'title': '4. Lịch sử',
        'description': 'Theo dõi tiến độ học tập và kết quả các lần thi',
        'icon': IconPath.lichSu,
      },
    ];

    final tips = [
      'Học đều đặn mỗi ngày 30-60 phút',
      'Làm thi thử nhiều lần để quen format đề',
      'Ôn kỹ các câu liệt và câu điểm',
    ];

    return Scaffold(
      appBar: AppBar(
        title: _buildAppTitleView(context),
        backgroundColor: AppColor.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Tutorial Steps
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                children: [
                  ...tutorialSteps.map(
                    (step) => Card.outlined(
                      elevation: 1,
                      margin: const EdgeInsets.only(bottom: 16),
                      color: AppColor.background,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColor.secondary.withOpacity(0.75),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Image.asset(step['icon']!, width: 45),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    step['title']!,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.textPrimary,
                                    ),
                                  ),
                                  Text(
                                    step['description']!,
                                    style: TextStyle(
                                      color: AppColor.textPrimary.withOpacity(
                                        0.75,
                                      ),
                                      fontSize: 14,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Tips Card
                  _buildTipsCard(tips),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppTitleView(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Hướng dẫn sử dụng',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            'Làm theo 4 bước để đậu GPLX',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildTipsCard(List<String> tips) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColor.secondary),
        color: AppColor.background,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('💡', style: TextStyle(fontSize: 24)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mẹo học hiệu quả',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.secondary,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                ...tips.map(
                  (tip) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.check,
                          size: 24,
                          color: AppColor.borderSuccess,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            tip,
                            style: const TextStyle(
                              color: AppColor.textPrimary,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
