import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthy_food/core/theme/app_colors.dart';
import 'package:healthy_food/features/auth/views/signin_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: FlutterSplashScreen.scale(
        duration: const Duration(seconds: 2),
        backgroundColor: AppColors.scaffoldBackgroundColor,
        childWidget: Center(
          child: Image.asset(
            'assets/images/Healthy Slogan.png',
            height: 220.h,
          ),
        ),
        nextScreen: const SignInScreen(),
      ),
    );
  }
}
