import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../home/data/recipe_model.dart';
import '../../home/widgets/recipe_container.dart';
import '../logic/cubit/favorite_cubit.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<RecipeModel> favoriteList =
        BlocProvider.of<FavoriteCubit>(context).favoriteList;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          elevation: 0,
          title: const Text('Your Favorites'),
          centerTitle: true,
        ),
        body: BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
          return favoriteList.isEmpty
              ? Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/images/EmptyFavoriteLottie.json',
                        width: 300.w),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                       'No favorite recipes yet ? Explore our delicious collection and add your favorites! 🍲🥗',
                      style: TextStyle(fontSize: 14.sp, fontFamily: 'Poppins'),
                      textAlign: TextAlign.center,
                    )
                  ],
                ))
              : ListView.builder(
                  itemCount: favoriteList.length,
                  itemBuilder: (context, index) {
                    final recipe = favoriteList[index];
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: RecipeCard(
                        recipeModel: recipe,
                        isFavoriteView: true,
                        onPressed: () {
                          BlocProvider.of<FavoriteCubit>(context)
                              .removeFromFavorite(recipe);
                        },
                      ),
                    );
                  },
                );
        }));
  }
}
