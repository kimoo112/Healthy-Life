// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthy_food/core/theme/app_colors.dart';

import '../../../generated/l10n.dart';
import 'food_category_widget.dart';

class AnimatedCategoryList extends StatefulWidget {
  final Duration categoryListPlayDuration;
  final TabController tabController;
  final Duration categoryListDelayDuration;
  const AnimatedCategoryList({
    Key? key,
    required this.categoryListPlayDuration,
    required this.categoryListDelayDuration,
    required this.tabController,
  }) : super(key: key);

  @override
  State<AnimatedCategoryList> createState() => _AnimatedCategoryListState();
}

class _AnimatedCategoryListState extends State<AnimatedCategoryList> {
  @override
  Widget build(BuildContext context) {
    var categories = [
      FoodCategoryWidget(icon: "🔥", name: S.of(context).popularCategory),
      FoodCategoryWidget(icon: "🥦", name: S.of(context).healthyCategory),
      FoodCategoryWidget(icon: "🍲", name: S.of(context).soupCategory),
      FoodCategoryWidget(icon: "🍿", name: S.of(context).snacksCategory),
    ];
    return TabBar(
      splashBorderRadius: BorderRadius.circular(22.0.r),
      dividerColor: AppColors.scaffoldBackgroundColor,
      indicator: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors
                .scaffoldBackgroundColor, // Set the border color to transparent
            width: 0.0, // Set the border thickness to 0
          ),
        ),
      ),
      labelColor: const Color.fromARGB(255, 212, 173, 54),
      labelStyle: TextStyle(fontFamily: S.of(context).fontFamily),
      indicatorColor: Colors.transparent,
      controller: widget.tabController,
      isScrollable: true,
      tabs: categories.map((category) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white.withOpacity(.3), // Set the border color
              width: 2.0, // Set the border thickness
            ),
            borderRadius:
                BorderRadius.circular(22.0.r), // Set the border radius
          ),
          padding: EdgeInsets.symmetric(horizontal: 25.0.h, vertical: 8.0.w),
          child: Row(
            children: [
              Text(category.icon),
              const SizedBox(width: 8.0),
              Text(category.name),
            ],
          ),
        );
      }).toList(),
    ).animate(delay: widget.categoryListDelayDuration).slideX(
        duration: widget.categoryListPlayDuration,
        begin: 4,
        end: 0,
        curve: Curves.easeInOutSine);
  }
}
