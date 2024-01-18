import 'package:flutter/material.dart';

import '../../details/views/details_view.dart';
import '../data/recipe_model.dart';
import 'recipe_container.dart';

class RecipeListView extends StatelessWidget {
  const RecipeListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: recipes.length,
        itemBuilder: (BuildContext context, int index) {
          final RecipeModel recipeModel = recipes[index];
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
