import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

enum RoundButtonType { primaryBG, secondaryBG }

class RoundButton extends StatelessWidget {
  final String title;
  final RoundButtonType type;
  final Function() onPressed;

  const RoundButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.type = RoundButtonType.secondaryBG})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
         color: AppColors.bodySmallTextColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, blurRadius: 2, offset: Offset(0, 2))
          ]),
      child: MaterialButton(
        minWidth: double.maxFinite,
        height: 50,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        textColor: AppColors.scaffoldBackgroundColor,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 11,
            color: AppColors.scaffoldBackgroundColor,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
