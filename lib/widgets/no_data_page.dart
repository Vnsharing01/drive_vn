import 'package:flutter/material.dart';

class NoDataPage extends StatelessWidget {
  const NoDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      elevation: 1.5,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "🎯",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              'Chưa có dữ liệu',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Vui lòng quay lại sau.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
