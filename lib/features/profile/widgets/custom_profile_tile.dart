import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthy_food/core/theme/app_colors.dart';

import '../../../generated/l10n.dart';

class CustomProfileTile extends StatelessWidget {
  const CustomProfileTile({
    super.key,
    this.onTap,
    required this.title,
    this.subtitle,
    required this.icon,
    this.trailing,
  });
  final void Function()? onTap;
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: ListTile(
        leading: Icon(
          icon,
          color: AppColors.bodySmallTextColor,
        ),
        title: Text(
          title.toUpperCase(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 4.0.sp),
          child: Text(
            subtitle ?? '',
            style: TextStyle(
                fontWeight: FontWeight.w200,
                fontFamily: S.of(context).fontFamily),
          ),
        ),
        trailing: trailing ??
            const Icon(
              IconlyLight.arrowRight2,
              color: AppColors.bodySmallTextColor,
            ),
      ),
    );
  }
}
