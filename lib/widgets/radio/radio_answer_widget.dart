import 'package:drivevn/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class RadioAnswerWidget extends StatefulWidget {
  const RadioAnswerWidget({
    super.key,
    required this.title,
    this.onChanged,
    required this.value,
    required this.groupValue,
  });
  final String title;
  final void Function(int value)? onChanged;
  final int value;
  final int groupValue;

  @override
  State<RadioAnswerWidget> createState() => _RadioAnswerWidgetState();
}

class _RadioAnswerWidgetState extends State<RadioAnswerWidget> {
  @override
  Widget build(BuildContext context) {
    final isSelected = widget.value == widget.groupValue;
    return InkWell(
      onTap: () {
        widget.onChanged?.call(widget.value);
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColor.success.withOpacity(0.2)
              : AppColor.background,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColor.success : Theme.of(context).focusColor,
            width: 1.5,
          ),
        ),
        child: Text(
          widget.title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 16,
                color: AppColor.textPrimary,
              ),
        ),
      ),
    );
  }
}
