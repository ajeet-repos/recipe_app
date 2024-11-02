import 'package:equatable/equatable.dart';
import 'package:recipe_app/models/recipe.dart';

abstract class RecentRecipesState extends Equatable {
  const RecentRecipesState();

  @override
  List<Object?> get props => [];
}

class RecentRecipeInitial extends RecentRecipesState {}
class RecentRecipeLoading extends RecentRecipesState {}
class RecentRecipeLoaded extends RecentRecipesState {
  final List<Recipe> recentRecipeList;

  const RecentRecipeLoaded(this.recentRecipeList);

  @override
  List<Object?> get props => [recentRecipeList];
}

class RecentRecipeSelected extends RecentRecipesState {
  final Recipe selectedRecipe;

  const RecentRecipeSelected(this.selectedRecipe);

  @override
  List<Object?> get props => [selectedRecipe];
}

class RecentRecipeError extends RecentRecipesState {
  final String message;

  const RecentRecipeError(this.message);

}