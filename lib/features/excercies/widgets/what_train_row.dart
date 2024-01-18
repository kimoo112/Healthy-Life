import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'round_button.dart';

import '../../../core/theme/app_colors.dart';
import '../../../generated/l10n.dart';

class WhatTrainRow extends StatelessWidget {
  final Map wObj;
  const WhatTrainRow({Key? key, required this.wObj}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              AppColors.cardColor,
              AppColors.cardColor.withOpacity(.9),
            ]),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    wObj["title"].toString(),
                    style: TextStyle(
                        color: AppColors.whiteColor,
                        fontFamily: S.of(context).fontFamily,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                   SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    "${wObj["exercises"].toString()} | ${wObj["time"].toString()}",
                    style: TextStyle(
                      color: AppColors.infoTextColor,
                      fontFamily: S.of(context).fontFamily,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 100,
                    height: 30,
                    child: RoundButton(title: S.of(context).ViewMore, onPressed: () {}),
                  )
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor.withOpacity(0.54),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      wObj["image"].toString(),
                      width: 90,
                      height: 90,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
