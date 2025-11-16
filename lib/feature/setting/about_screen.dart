import 'package:drivevn/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB), // bg-gray-50
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                children: [
                  _buildMainInfoCard(),
                  const SizedBox(height: 16),
                  _buildFeaturesCard(),
                  const SizedBox(height: 16),
                  _buildDeveloperInfoCard(),
                  const SizedBox(height: 16),
                  _buildCopyright(),
                ],
              ),
            ),
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
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => context.pop(),
          ),
          const Text(
            'Về DriveVN',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainInfoCard() {
    return Card(
      elevation: 1.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Container(
              width: 96,
              height: 96,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF34D399), AppColor.primary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: const Center(
                child: Text('🚗', style: TextStyle(fontSize: 50)),
              ),
            ),
            const Text(
              'DriveVN',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Ứng dụng ôn thi giấy phép lái xe',
              style: TextStyle(color: Color(0xFF4B5563)),
            ),
            const SizedBox(height: 16),
            Chip(
              label: const Text(
                'Phiên bản 1.0.0',
                style: TextStyle(
                  color: Color(0xFF065F46),
                  fontWeight: FontWeight.w600,
                ),
              ),
              backgroundColor: const Color(0xFFD1FAE5),
              padding: const EdgeInsets.symmetric(horizontal: 8),
            ),
          ],
        ),
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
    return Card(
      elevation: 1.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '✨ Tính năng nổi bật',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
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
                          color: Color(0xFF374151),
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

  Widget _buildDeveloperInfoCard() {
    return Card(
      elevation: 1.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '👨‍💻 Nhà phát triển',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'DriveVN được phát triển bởi đội ngũ yêu thích công nghệ, mong muốn giúp người Việt dễ dàng ôn tập và đậu giấy phép lái xe.',
              style: TextStyle(
                color: Color(0xFF374151),
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const Divider(height: 32, thickness: 0.5),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Email: ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(text: 'support@drivevn.com'),
                ],
              ),
              style: TextStyle(color: Color(0xFF4B5563), fontSize: 14),
            ),
            const SizedBox(height: 4),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Website: ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(text: 'www.drivevn.com'),
                ],
              ),
              style: TextStyle(color: Color(0xFF4B5563), fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCopyright() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        '© 2024 DriveVN Team. All rights reserved.',
        style: TextStyle(color: Color(0xFF6B7280), fontSize: 12),
      ),
    );
  }
}
