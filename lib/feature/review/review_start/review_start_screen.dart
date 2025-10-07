import 'package:drivevn/core/constants/app_color.dart';
import 'package:drivevn/widgets/button/button_fill.dart';
import 'package:drivevn/widgets/button/button_outline.dart';
import 'package:flutter/material.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Ôn lại",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          child: Column(
            children: [
              Card.filled(
                elevation: 2,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tổng quan',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        children: [
                          Text(
                            'Số câu đã sai: ',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            '5',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.error,
                                ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ButtonFill(
                title: 'Bắt đầu ôn lại',
                color: AppColor.secondary,
                onTap: () {},
              ),
              const SizedBox(height: 8),
              ButtonOutline(
                title: 'Xoá tất cả',
                color: AppColor.secondary,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
