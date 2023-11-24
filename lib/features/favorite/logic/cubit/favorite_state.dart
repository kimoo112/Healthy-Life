part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteisEmpty extends FavoriteState {}

class FavoriteListChanged extends FavoriteState {
  final List<RecipeModel> favoriteList;

  FavoriteListChanged(this.favoriteList);
}

final class AddedToFavoriteSuccefuly extends FavoriteState {}

final class ThisItemInFavorite extends FavoriteState {}

final class RemovedFromFavorite extends FavoriteState {}

final class AllRemoved extends FavoriteState {}
