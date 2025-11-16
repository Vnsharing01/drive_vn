import 'package:drivevn/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TutorialStep {
  final IconData icon;
  final String title;
  final String description;

  TutorialStep({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TutorialStep> tutorialSteps = [
      TutorialStep(
        icon: Icons.model_training,
        title: 'Bước 1: Luyện tập theo chủ đề',
        description:
            'Bắt đầu bằng việc học và luyện tập các câu hỏi được phân loại theo từng chủ đề như biển báo, sa hình, khái niệm và quy tắc.',
      ),
      TutorialStep(
        icon: Icons.quiz,
        title: 'Bước 2: Thi thử như thi thật',
        description:
            'Thử sức với các bộ đề thi thử ngẫu nhiên gồm 25 câu trong 20 phút. Điều này giúp bạn làm quen với áp lực thời gian và cấu trúc đề thi.',
      ),
      TutorialStep(
        icon: Icons.history,
        title: 'Bước 3: Ôn lại các câu đã sai',
        description:
            'Hệ thống sẽ tự động lưu lại các câu bạn đã trả lời sai. Hãy vào mục "Ôn lại" để học lại và đảm bảo bạn không mắc lại lỗi tương tự.',
      ),
      TutorialStep(
        icon: Icons.check_circle_outline,
        title: 'Bước 4: Tự tin thi đậu',
        description:
            'Khi đã nắm vững kiến thức và đạt điểm cao trong các bài thi thử, bạn đã sẵn sàng để tham gia kỳ thi sát hạch chính thức.',
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB), // bg-gray-50
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            _buildTutorialSteps(tutorialSteps),
            _buildTipsCard(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 48, bottom: 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.primary,
            Color(0xFF22C55E),
          ], // from-green-500 to-green-600
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => context.pop(),
              ),
              const Text(
                'Hướng dẫn sử dụng',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 56),
            child: Text(
              'Làm theo 4 bước để đậu GPLX',
              style: TextStyle(
                color: Color(0xFFD1FAE5),
                fontSize: 14,
              ), // text-green-100
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTutorialSteps(List<TutorialStep> steps) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: steps.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final step = steps[index];
          return Card(
            elevation: 1.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF34D399), AppColor.primary],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(step.icon, color: Colors.white, size: 32),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          step.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1F2937),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          step.description,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF4B5563),
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTipsCard() {
    // This widget is left out as it was not requested in the prompt.
    // You can add the implementation for the tips card here if needed.
    return const SizedBox.shrink();
  }
}
