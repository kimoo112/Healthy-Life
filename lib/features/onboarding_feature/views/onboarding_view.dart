import 'package:flutter/material.dart';
import 'package:healthy_food/core/widgets/annotated_scaffold.dart';
import 'package:healthy_food/features/onboarding_feature/widgets/onboarding_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AnnotatedScaffold(
      child: OnBoardingBodyWidget(),
    );
  }
}
