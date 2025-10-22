import 'package:drivevn/core/constants/app_color.dart';
import 'package:drivevn/core/constants/icon_path.dart';
import 'package:drivevn/core/router/router_path.dart';
import 'package:drivevn/feature/home/components/home_feature_widget.dart';
import 'package:drivevn/feature/home/components/item_banner_widget.dart';
import 'package:drivevn/feature/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                children: [
                  _buildTopBanner(),
                  const SizedBox(height: 8),
                  _buildLatestTestView(context),
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
          );
        },
      ),
    );
  }

  Widget _buildLatestTestView(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Container(
          height: 100,
          decoration: BoxDecoration(
            color: AppColor.topBanner,
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            border: Border.all(
              color: Theme.of(context).focusColor,
              width: 1,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemBannerWidget(
                title: 'Tỷ lệ đậu',
                value: '${state.latestTestModel?.passRate ?? 0}%',
              ),
              ItemBannerWidget(
                title: 'Lần thi',
                value: '${state.latestTestModel?.totalTest ?? 0}',
              ),
              ItemBannerWidget(
                title: 'Số câu đúng',
                value: '${state.latestTestModel?.correctQuestions ?? 0}',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTopBanner() {
    return Container(
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
            offset: Offset(0, 2),
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
    );
  }
}
