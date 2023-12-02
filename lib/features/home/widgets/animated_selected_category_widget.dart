// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../generated/l10n.dart';

class AnimatedSelectedCategoryWidget extends StatelessWidget {
  final Duration selectedCategoryPlayDuration;
  final Duration selectedCategoryDelayDuration;
  const AnimatedSelectedCategoryWidget({
    Key? key,
    required this.selectedCategoryPlayDuration,
    required this.selectedCategoryDelayDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        S.of(context).Recipes,
        style: Theme.of(context).textTheme.titleLarge,
      )
          .animate()
          .fadeIn(
              delay: selectedCategoryDelayDuration,
              duration: selectedCategoryPlayDuration,
              curve: Curves.decelerate)
          .slideX(begin: 0.2, end: 0),
    );
  }
}
