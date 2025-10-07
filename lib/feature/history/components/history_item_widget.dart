import 'package:drivevn/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class HistoryItemWidget extends StatelessWidget {
  const HistoryItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      elevation: 2,
      color: AppColor.background,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Thi thử lần 24',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Text('2 giờ trước • 25 câu'),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '21/25',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primary,
                      ),
                ),
                const Text('80%'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
