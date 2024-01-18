import 'package:flutter/material.dart';

import '../../details/views/details_view.dart';
import '../data/recipe_model.dart';
import 'recipe_container.dart';
class SoupListView extends StatelessWidget {
  const SoupListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<RecipeModel> healthyRecipes =
        recipes.where((recipe) => recipe.isSoup).toList();
    return ListView.builder(
        shrinkWrap: true,
        itemCount: healthyRecipes.length,
        itemBuilder: (BuildContext context, int index) {
          final List<RecipeModel> healthyRecipes =
              recipes.where((recipe) => recipe.isSoup).toList();
          final RecipeModel recipeModel = healthyRecipes[index];
          return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        RecipeDetailsView(recipe: recipeModel),
                  ),
                );
              },
              child: RecipeCard(
                recipeModel: recipeModel,
                isFavoriteView: false,
              ));
        });
  }
}
