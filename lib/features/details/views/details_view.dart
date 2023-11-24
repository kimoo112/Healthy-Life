// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_food/features/favorite/logic/cubit/favorite_cubit.dart';
import 'package:healthy_food/features/home/data/recipe_model.dart';

import '../../../core/widgets/annotated_scaffold.dart';
import '../widgets/animated_app_bar_widget.dart';
import '../widgets/animated_dish_widget.dart';
import '../widgets/animated_info_widget.dart';
import '../widgets/time_line_sliding_panel.dart';

class RecipeDetailsView extends StatelessWidget {
  final RecipeModel recipe;
  const RecipeDetailsView({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool isFavorite =
    //     BlocProvider.of<FavoriteCubit>(context).isFavorite(recipe);
    return AnnotatedScaffold(
      child: LayoutBuilder(builder: (context, constraints) {
        final appBarPlayTime = 800.ms;
        final appBarDelayTime = 400.ms;
        final infoDelayTime = appBarPlayTime + appBarDelayTime - 200.ms;
        final infoPlayTime = 500.ms;
        final dishPlayTime = 600.ms;
        return TimeLineSlidingPanel(
            recipe: recipe,
            constraints: constraints,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  BlocBuilder<FavoriteCubit, FavoriteState>(
                    builder: (context, state) {
                      bool isFavorite = false; // Default value
                      if (state is FavoriteListChanged) {
                        isFavorite = state.favoriteList.contains(recipe);
                      }
                      return AnimatedAppBarWidget(
                        onPressed: () {
                          isFavorite
                              ? BlocProvider.of<FavoriteCubit>(context)
                                  .removeFromFavorite(recipe)
                              : BlocProvider.of<FavoriteCubit>(context)
                                  .addToFavorite(recipe);
                        },
                        name: recipe.name,
                        appBarPlayTime: appBarPlayTime,
                        appBarDelayTime: appBarDelayTime,
                        isFavorite: isFavorite,
                      );
                    },
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.04,
                  ),
                  AnimatedDishWidget(
                    constraints: constraints,
                    imageUrl: recipe.imageUrl,
                    dishPlayTime: dishPlayTime,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.06,
                  ),
                  AnimatedInfoWidget(
                      nutrition: recipe.nutrition,
                      infoDelayTime: infoDelayTime,
                      infoPlayTime: infoPlayTime,
                      constraints: constraints),
                ],
              ),
            ));
      }),
    );
  }
}
