// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_food/core/theme/app_colors.dart';

import '../../profile/logic/cubit/profile_image_cubit.dart';
import 'animated_name_widget.dart';

class AnimatedAppBarWidget extends StatelessWidget {
  final Duration avatarWaitingDuration;

  final Duration avatarPlayDuration;

  final Duration nameDelayDuration;

  final Duration namePlayDuration;

  const AnimatedAppBarWidget({
    Key? key,
    required this.avatarWaitingDuration,
    required this.avatarPlayDuration,
    required this.nameDelayDuration,
    required this.namePlayDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        AnimatedNameWidget(
          namePlayDuration: namePlayDuration,
          nameDelayDuration: nameDelayDuration,
        ),
        Expanded(child: Container()),
        BlocBuilder<ProfileImageCubit, ProfileImageState>(
          builder: (context, state) {
             String image =
                BlocProvider.of<ProfileImageCubit>(context).imagePath;
            return CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.bodySmallTextColor,
               backgroundImage: image != ''
                  ? FileImage(File(image)) as ImageProvider
                  : NetworkImage(
                      '${FirebaseAuth.instance.currentUser?.photoURL}'),
            );
          },
        )
            .animate()
            .scaleXY(
                begin: 0,
                end: 2,
                duration: avatarPlayDuration,
                curve: Curves.easeInOutSine)
            .then(delay: avatarWaitingDuration)
            .scaleXY(begin: 3, end: 1)
            .slide(begin: const Offset(-4, 6), end: Offset.zero),
        const SizedBox(
          width: 25,
        )
      ],
    );
  }
}
