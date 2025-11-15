import 'package:drivevn/core/constants/app_color.dart';
import 'package:drivevn/feature/setting/bloc/setting_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<SettingBloc, SettingState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 225,
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColor.background,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const SizedBox(height: 80, width: 80),
                        ),
                        Text(
                          'DriveVN',
                          style: Theme.of(
                            context,
                          ).textTheme.headlineMedium?.copyWith(
                            color: AppColor.background,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Ứng dụng ôn thi GPLX hạng A1, A2, B1, B2',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: AppColor.background),
                        ),
                        Text(
                          'Phiên bản 1.0.0',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: AppColor.background),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Cài đặt',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Column(
                      children: [
                        _buildSettingItem(
                          context: context,
                          icon:
                              !state.isDarkMode
                                  ? Icons.light_mode_outlined
                                  : Icons.dark_mode_outlined,
                          title: 'Chế độ tối',
                          subTitle:
                              !state.isDarkMode ? 'Chế độ sáng' : 'Chế độ tối',
                          trailing: CupertinoSwitch(
                            value: state.isDarkMode,
                            onChanged: (value) {
                              context.read<SettingBloc>().add(
                                const ToggleDarkModeEvent(),
                              );
                            },
                            activeTrackColor: AppColor.primary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildSettingItem(
                          context: context,
                          icon: Icons.help_outline,
                          title: 'Hướng dẫn sử dụng',
                          subTitle: 'Cách sử dụng ứng dụng',
                          onTap: () {
                            // TODO: Điều hướng đến màn hình hướng dẫn
                          },
                        ),
                        const SizedBox(height: 8),
                        _buildSettingItem(
                          context: context,
                          icon: Icons.info_outline,
                          title: 'Về DriveVN',
                          subTitle: 'Xem thông tin về ứng dụng',
                          onTap: () {
                            // TODO: Hiển thị dialog hoặc điều hướng đến màn hình thông tin
                          },
                        ),
                        const SizedBox(height: 8),
                        _buildSettingItem(
                          context: context,
                          icon: Icons.star_outline,
                          title: 'Đánh giá ứng dụng',
                          subTitle: 'Ủng hộ và đánh giá ứng dụng',
                          onTap: () {
                            // TODO: Hiển thị dialog hoặc điều hướng đến màn hình thông tin
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    String? subTitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return Card.outlined(
      elevation: 1.5,
      color: AppColor.background,
      child: ListTile(
        leading: Icon(icon, color: AppColor.primary, size: 32),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        subtitle:
            subTitle != null
                ? Text(subTitle, style: const TextStyle(fontSize: 12))
                : null,
        trailing:
            trailing ??
            Icon(
              Icons.chevron_right_sharp,
              color: Theme.of(context).primaryColor,
            ),
        onTap: onTap,
      ),
    );
  }
}
