import 'package:drivevn/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Về DriveVN',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColor.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                children: [
                  _buildItemInfoCard(
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: const Center(
                            child: Text('🚗', style: TextStyle(fontSize: 50)),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'DriveVN',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColor.textPrimary,
                          ),
                        ),
                        const Text(
                          'Ứng dụng ôn thi giấy phép lái xe',
                          style: TextStyle(color: AppColor.textPrimary),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Phiên bản 1.0.0',
                          style: TextStyle(
                            color: AppColor.textPrimary,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildFeaturesCard(),
                  const SizedBox(height: 8),
                  _buildItemInfoCard(
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '👨‍💻 Nhà phát triển',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColor.textPrimary,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'DriveVN được phát triển bởi đội ngũ yêu thích công nghệ, mong muốn giúp người Việt dễ dàng ôn tập và đậu giấy phép lái xe.',
                            style: TextStyle(
                              color: AppColor.textPrimary,
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                          Divider(height: 28, thickness: 0.75),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Email: ',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                TextSpan(text: 'shimarin.dev@gmail.com'),
                              ],
                            ),
                            style: TextStyle(
                              color: AppColor.textPrimary,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      '© 2025 Shimarin Team.',
                      style: TextStyle(
                        color: AppColor.textPrimary,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemInfoCard({Widget? child}) {
    return Card.outlined(
      elevation: 1.5,
      color: AppColor.background,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24.0),
        child: child,
      ),
    );
  }

  Widget _buildFeaturesCard() {
    final features = [
      '600+ câu hỏi lý thuyết cập nhật mới nhất',
      'Thi thử giống đề thi thật 100%',
      'Lưu lịch sử học tập và tiến độ',
      'Giao diện thân thiện, dễ sử dụng',
      'Học offline, không cần Internet',
    ];
    return _buildItemInfoCard(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '✨ Tính năng nổi bật',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            ...features.map(
              (feature) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.check, color: AppColor.primary, size: 20),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        feature,
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
    );
  }
}
