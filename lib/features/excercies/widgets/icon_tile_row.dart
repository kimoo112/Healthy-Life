import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../generated/l10n.dart';

class IconTitleNextRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String time;
  final VoidCallback onPressed;
  final Color color;
  const IconTitleNextRow(
      {Key? key,
      required this.icon,
      required this.title,
      required this.time,
      required this.onPressed,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: AppColors.onBoardingButtonColor,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                    fontFamily: S.of(context).fontFamily,
                    color: AppColors.whiteColor,
                    fontSize: 12),
              ),
            ),
            SizedBox(
              width: 120,
              child: Text(
                time,
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontFamily: S.of(context).fontFamily,
                    color: AppColors.whiteColor,
                    fontSize: 12),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_right,
                color: AppColors.bodySmallTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
