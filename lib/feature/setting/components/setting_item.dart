import 'package:drivevn/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.context,
    required this.icon,
    required this.title,
    this.subTitle,
    this.trailing,
    this.onTap,
  });
  final BuildContext context;
  final IconData icon;
  final String title;
  final String? subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
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
                ? Text(subTitle ?? '', style: const TextStyle(fontSize: 12))
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
