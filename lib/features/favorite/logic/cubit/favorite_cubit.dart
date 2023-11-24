import 'package:bloc/bloc.dart';
import 'package:healthy_food/features/home/data/recipe_model.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  List<RecipeModel> favoriteList = [];
  bool isFavoritee = false;
  addToFavorite(RecipeModel recipe) {
    favoriteList.add(recipe);
    emit(FavoriteListChanged(favoriteList));
  }

  removeFromFavorite(RecipeModel recipe) {
    favoriteList.remove(recipe);
    emit(FavoriteListChanged(favoriteList));
  }

   isFavorite(RecipeModel recipe) {
emit(ThisItemInFavorite());
 return favoriteList.contains(recipe);
  }
}
