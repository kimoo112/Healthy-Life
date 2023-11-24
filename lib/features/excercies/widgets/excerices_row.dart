import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class ExercisesRow extends StatelessWidget {
  final Map eObj;
  final VoidCallback onPressed;
  const ExercisesRow({Key? key, required this.eObj, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              eObj["image"].toString(),
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eObj["title"].toString(),
                    style: TextStyle(color: AppColors.whiteColor, fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    eObj["value"].toString(),
                    style: TextStyle(
                      color: AppColors.infoTextColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              )),
          IconButton(
              onPressed: onPressed,
              icon: Image.asset(
                "assets/icons/next_go.png",
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ))
        ],
      ),
    );
  }
}
