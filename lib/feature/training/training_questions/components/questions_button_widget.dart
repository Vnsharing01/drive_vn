import 'package:drivevn/core/constants/app_color.dart';
import 'package:drivevn/data/models/question_model.dart';
import 'package:flutter/material.dart';

class QuestionsButtonWidget extends StatelessWidget {
  const QuestionsButtonWidget({
    super.key,
    required this.item,
    this.onTap,
    this.isSelected = false,
  });

  final QuestionModel item;
  final void Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card.outlined(
        elevation: 1.5,
        semanticContainer: false,
        color: !isSelected
            ? AppColor.background
            : AppColor.flatPrimaryBackground.withOpacity(0.8),
        shape: !isSelected
            ? null
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(
                  color: AppColor.borderSuccess,
                  width: 2,
                ),
              ),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(
            '${item.id}',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
