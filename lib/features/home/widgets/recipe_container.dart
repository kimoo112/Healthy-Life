// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/recipe_model.dart';

class RecipeCard extends StatelessWidget {
  final RecipeModel recipeModel;
  final bool isFavoriteView;
  final void Function()? onPressed;
  const RecipeCard({
    Key? key,
    required this.recipeModel,
    required this.isFavoriteView,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playDuration = 600.ms;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: Card(
        color: ColorEffect.neutralValue,
        margin: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _AnimatedImageWidget(
              imageUrl: recipeModel.imageUrl,
              playDuration: playDuration,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AnimatedNameWidget(
                    playDuration: playDuration, name: recipeModel.name),
                _AnimatedDescriptionWidget(
                    playDuration: playDuration,
                    description: recipeModel.description),
                _AnimatedNutritionText(
                  playDuration: playDuration,
                  nutrition: recipeModel.nutrition,
                )
              ],
            ),
            if (isFavoriteView)
              IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  CupertinoIcons.trash,
                  color: Color.fromARGB(255, 221, 77, 96),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedNutritionText extends StatelessWidget {
  final Duration playDuration;
  final Nutrition nutrition;
  const _AnimatedNutritionText({
    Key? key,
    required this.playDuration,
    required this.nutrition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("${nutrition.calories} Cal ",
                style: Theme.of(context).textTheme.labelMedium //label medium
                )
            .animate()
            .scaleXY(
                begin: 0,
                end: 1,
                delay: 300.ms,
                duration: playDuration - 100.ms,
                curve: Curves.decelerate),
        SizedBox(width: 30.w),
        Text("${nutrition.protein} Protein",
                style: Theme.of(context).textTheme.labelMedium //label medium
                )
            .animate()
            .scaleXY(
                begin: 0,
                end: 1,
                delay: 300.ms,
                duration: playDuration - 100.ms,
                curve: Curves.decelerate),
      ],
    );
  }
}

class _AnimatedImageWidget extends StatelessWidget {
  final Duration playDuration;
  final String imageUrl;
  const _AnimatedImageWidget({
    Key? key,
    required this.playDuration,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            constraints: const BoxConstraints(maxHeight: 150, maxWidth: 150),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ))
        .animate(delay: 700.ms)
        .shimmer(duration: playDuration - 100.ms)
        .flip();
  }
}

class _AnimatedNameWidget extends StatelessWidget {
  final Duration playDuration;
  final String name;
  const _AnimatedNameWidget({
    Key? key,
    required this.playDuration,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 150),
      alignment: Alignment.centerLeft,
      child: Text(name,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: true,
              style: Theme.of(context).textTheme.titleLarge //title large
              )
          .animate()
          .fadeIn(
              duration: 300.ms, delay: playDuration, curve: Curves.decelerate)
          .slideX(begin: 0.2, end: 0),
    );
  }
}

class _AnimatedDescriptionWidget extends StatelessWidget {
  final Duration playDuration;
  final String description;
  const _AnimatedDescriptionWidget({
    Key? key,
    required this.playDuration,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(top: 10, left: 5, bottom: 10),
      constraints: const BoxConstraints(maxWidth: 150),
      child: Text(description,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              softWrap: true,
              style: Theme.of(context).textTheme.labelLarge //label large
              )
          .animate()
          .scaleXY(
              begin: 0,
              end: 1,
              delay: 300.ms,
              duration: playDuration - 100.ms,
              curve: Curves.decelerate),
    );
  }
}
