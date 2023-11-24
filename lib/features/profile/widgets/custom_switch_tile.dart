import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class CustomSwitchTile extends StatelessWidget {
  const CustomSwitchTile({
    super.key,
    required this.isAllowed,
    required this.leadingIcon,
    required this.enabledSubtitle,
    required this.title,
    required this.desabledSubtitle,
    this.onChanged,
  });

  final bool isAllowed;
  final IconData leadingIcon;
  final String enabledSubtitle;
  final String title;
  final String desabledSubtitle;
  final void Function(bool)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      activeTrackColor: AppColors.timeLineColor,
      activeColor: AppColors.whiteColor,
      inactiveThumbColor: AppColors.whiteColor,
      inactiveTrackColor: AppColors.trashColor,
      overlayColor: MaterialStatePropertyAll(Theme.of(context).primaryColor),
      trackOutlineColor: const MaterialStatePropertyAll(Colors.transparent),
      value: isAllowed,
      onChanged: onChanged,
      secondary: Icon(
        leadingIcon,
        color: isAllowed ? AppColors.timeLineColor : AppColors.trashColor,
      ),
      title: Text(
        title.toUpperCase(),
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        isAllowed ? enabledSubtitle : desabledSubtitle,
        style: TextStyle(
            color: isAllowed ? AppColors.timeLineColor : AppColors.trashColor),
      ),
    );
  }
}
