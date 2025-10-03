import 'package:drivevn/core/constants/app_color.dart';
import 'package:drivevn/core/constants/icon_path.dart';
import 'package:drivevn/core/utils/router/router_path.dart';
import 'package:drivevn/feature/home/components/home_feature_widget.dart';
import 'package:drivevn/feature/home/components/item_banner_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: AppColor.background,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Chào mừng bạn đến với drivevn',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Luyện tập - Thi thử - Đậu chắc chắn!',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 100,
                decoration: const BoxDecoration(
                  color: AppColor.topBanner,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ItemBannerWidget(
                      title: 'Tỷ lệ đậu',
                      value: '85%',
                    ),
                    ItemBannerWidget(
                      title: 'Lần thi',
                      value: '35',
                    ),
                    ItemBannerWidget(
                      title: 'Số câu đúng',
                      value: '103',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  HomeFeatureWidget(
                    title: 'Luyện tập',
                    subTitle: 'Luyện theo chủ đề',
                    icon: IconPath.luyentap,
                    onTap: () {
                      context.push(RouterPath.training);
                    },
                  ),
                  HomeFeatureWidget(
                    title: 'Thi thử',
                    subTitle: '25 câu ngẫu nhiên',
                    icon: IconPath.thiThu,
                    onTap: () {
                      context.push(RouterPath.practiceStart);
                    },
                  ),
                  HomeFeatureWidget(
                    title: 'Ôn lại',
                    subTitle: 'Câu đã sai',
                    icon: IconPath.onLai,
                    onTap: () {
                      context.push(RouterPath.review);
                    },
                  ),
                  HomeFeatureWidget(
                    title: 'Lịch sử',
                    subTitle: 'Lịch sử làm bài',
                    icon: IconPath.lichSu,
                    onTap: () {
                      context.push(RouterPath.history);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
