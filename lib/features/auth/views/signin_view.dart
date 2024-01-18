import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';
import '../logic/cubit/google_auth_cubit.dart';
import 'package:ionicons/ionicons.dart';

import '../../../generated/l10n.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Logo or any other content
            Image.asset(
              'assets/images/Healthy Logo white.png',
              height: 150.h,
            ),
            const SizedBox(height: 40.0),
            // Animated Text Fields
            AnimatedTextField(
              label: S.of(context).email,
              delayDuration: 300,
            ),
            const SizedBox(height: 16.0),
            AnimatedTextField(
              label: S.of(context).password,
              delayDuration: 600,
              isPassword: true,
            ),
            const SizedBox(height: 16.0),
            // Lottie Animation
            // Lottie.asset(
            //   'assets/lottie/your_animation.json', // Replace with your Lottie file path
            //   height: 100,
            //   width: 100,
            // ),
            const SizedBox(height: 16.0),
            // Sign In Button
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<GoogleAuthCubit>(context)
                    .signInWithGoogle(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors
                    .onBoardingButtonColor, // Red accent color for the button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text(
                S.of(context).signinButton.toUpperCase(),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.scaffoldBackgroundColor,
                    fontFamily: S.of(context).fontFamily,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: .4),
              ),
            ),
            SizedBox(height: 20.h),
            BlocBuilder<GoogleAuthCubit, GoogleAuthState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<GoogleAuthCubit>(context)
                            .signInWithGoogle(context);
                      },
                      icon: const Icon(Ionicons.logo_google, size: 40),
                    ),
                    SizedBox(width: 10.w),
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<GoogleAuthCubit>(context)
                            .signInWithGoogle(context);
                      },
                      icon: const Icon(Ionicons.logo_facebook, size: 40),
                    ),
                    SizedBox(width: 10.w),
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<GoogleAuthCubit>(context)
                            .signInWithGoogle(context);
                      },
                      icon: const Icon(
                        Ionicons.logo_github,
                        size: 40,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedTextField extends StatelessWidget {
  const AnimatedTextField({
    Key? key,
    required this.label,
    required this.delayDuration,
    this.isPassword = false,
  }) : super(key: key);

  final String label;
  final int delayDuration;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 800),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double value, child) {
        return Opacity(
          opacity: value,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextFormField(
              obscureText: isPassword,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                //!ToDo add prefex icon
                labelText: label,
                suffixIcon: label == S.of(context).password
                    ? const Icon(CupertinoIcons.eye, color: Colors.white)
                    : null,
                labelStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w400),
                prefixIcon: label == S.of(context).email
                    ? const Icon(CupertinoIcons.mail_solid, color: Colors.white)
                    : label == S.of(context).password
                        ? const Icon(CupertinoIcons.lock, color: Colors.white)
                        : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.white.withOpacity(.5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: AppColors.onBoardingButtonColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.white.withOpacity(.5)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
