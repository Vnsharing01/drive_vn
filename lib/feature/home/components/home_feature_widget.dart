import 'package:drivevn/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class HomeFeatureWidget extends StatelessWidget {
  const HomeFeatureWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.icon,
      this.onTap});

  final String title;
  final String subTitle;
  final String icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Card.outlined(
        elevation: 1,
        color: AppColor.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 48,
              height: 48,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subTitle,
              style: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: AppColor.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
