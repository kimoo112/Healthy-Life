import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../generated/l10n.dart';

class AnimatedNameWidget extends StatelessWidget {
  final Duration namePlayDuration;
  final Duration nameDelayDuration;
  const AnimatedNameWidget({
    super.key,
    required this.namePlayDuration,
    required this.nameDelayDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "${S.of(context).Hello} \n${FirebaseAuth.instance.currentUser?.displayName} 👋 ",
      maxLines: 2,
      style:  TextStyle(
          fontSize: 28, fontWeight: FontWeight.bold, fontFamily: S.of(context).fontFamily),
    )
        .animate()
        .slideX(
            begin: 0.2,
            end: 0,
            duration: namePlayDuration,
            delay: nameDelayDuration,
            curve: Curves.fastOutSlowIn)
        .fadeIn();
  }
}
