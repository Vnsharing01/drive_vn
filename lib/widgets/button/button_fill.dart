import 'package:drivevn/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class ButtonFill extends StatelessWidget {
  const ButtonFill({
    super.key,
    this.onTap,
    this.color = AppColor.primary,
    required this.title,
  });

  final void Function()? onTap;
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColor.textPrimary.withOpacity(0.5),
              blurRadius: 2,
              offset: const Offset(0, 1.5),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: AppColor.textWhite,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
