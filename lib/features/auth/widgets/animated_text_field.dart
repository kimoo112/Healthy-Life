import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedTextField extends StatelessWidget {
  final String label;
  final int delayDuration;
  final bool isPassword;

  const AnimatedTextField({
    Key? key,
    required this.label,
    required this.delayDuration,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: 1.0,
      curve: Curves.easeInOut,
      child: TextFormField(
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    ).animate(
      delay: Duration(milliseconds: delayDuration),
    );
  }
}
