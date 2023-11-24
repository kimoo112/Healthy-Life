// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedAppBarWidget extends StatefulWidget {
  final String name;
  final Duration appBarPlayTime;
  final Duration appBarDelayTime;
  final void Function()? onPressed;
  final bool isFavorite;
  const AnimatedAppBarWidget({
    Key? key,
    required this.name,
    required this.onPressed,
    required this.appBarPlayTime,
    required this.appBarDelayTime, required this.isFavorite,
  }) : super(key: key);

  @override
  State<AnimatedAppBarWidget> createState() => _AnimatedAppBarWidgetState();
}

class _AnimatedAppBarWidgetState extends State<AnimatedAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 25,
            )),
        Text(
          widget.name.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
        IconButton(
          onPressed: widget.onPressed,
          icon: Icon(
            widget.isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart_slash,
            size: 25,
            color: widget.isFavorite ? Colors.red : null, // Set the color when filled
          ),
        ),
      ].animate(interval: 200.ms, delay: widget.appBarDelayTime).scaleXY(
          begin: 0,
          end: 1,
          duration: widget.appBarPlayTime,
          curve: Curves.decelerate),
    );
  }
}
